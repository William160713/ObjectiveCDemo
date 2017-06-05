# ObjectiveCDemo


Synopsis

三餐選擇器(以Swift寫成) 這個App可以推薦使用者餐點。在他們不知道要吃甚麼的時候，按下早午晚餐三個按鈕後App就會隨機推薦菜色跟其菜名。

其中使用了下列技術:

1.登入畫面有Facebook登入跟直接登入可以選擇

2.使用了TableViewController、Collection View Controller、 Tab Bar Controller、以及Navigation Controller 作為整個App的架構

3.App的主畫面裡放了三個按鈕分別為:早餐、午餐、晚餐，讓使用者可以選擇之外， 使用了if-else 判斷式以及arc4random_uniform() 函數來達成隨機推薦餐點的功能．

4.實作了推播功能

5.實作DispatchQueue的下載功能。

6.使用了UIBezierPath繪製了圖片。

淡水一日遊(以Objective-C寫成)

用Sketch自製了App的icon。
實作了FSCalendar來製作一個第三方行事曆。
實作AFNetworking來實現偵測網路的功能
實作QRCode掃描的功能。
Code Example 因為這是完全開源的App，內部程式碼請自行參閱。

Motivation

我設計這兩款App為了是展現我在Swift以及Objective-C上的程度，以及最做為面試時的Demo項目。其中若有不足的地方請不吝指正。

Installation 想要的話就直接下載拿去用沒關係。

Tests 我已經有用好UITest在專案裡面，直接用就可以了。

Contributors 想要的話可以直接開個分支加功能上去，謝謝!

License 可自由使用。
