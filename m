Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6DDC7EE30
	for <ath12k@archiver.kernel.org>; Wed,  2 Jul 2025 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2MKPmwkihSJIvonlzr1Gziih/vvNj7GjfEi89EPOls=; b=TUb9iYZPBjFQGqrF7NGkvWNrvg
	OGC2g3hcXSN6+JUojq4ZVi8J+5ViJvx3gyg0Zmi9gigWCa+WhNFBRfTwmO31RgKdLv+nWzsGs6cKY
	SrJI10/Smi3HvcP6rk0AKJPzxPexJqL0SBN1kwwPr9YPnryyoN5e23cj+PmqKL7HQJ6oLG4qDYujh
	k9rhm2e7Lc42nJn9g+agYZTkXSFMI9w80riDMfit5qrDTYB9RBD1qOtAVXULu4FWBf1EOfs+gapBV
	60XmECHVXF0LQJb+WEIUi7ovV7Hrk2x0tiXsEPclt/ek8unHaTQkZVIdtXGmv9DvtXGIwV8a/khV8
	Z7tzICKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv2h-000000080KL-28bY;
	Wed, 02 Jul 2025 10:50:19 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuDN-00000007rmV-32xX
	for ath12k@lists.infradead.org;
	Wed, 02 Jul 2025 09:57:19 +0000
Received: from [192.168.0.90] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mt8cD-1uqe5e3f57-00wWLW; Wed, 02 Jul 2025 11:57:11 +0200
Message-ID: <4f5398e8-302f-40e7-b718-decade935f4d@green-communications.fr>
Date: Wed, 2 Jul 2025 11:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC] wifi: Robust AV streaming Design Proposal for AP
To: Ben Greear <greearb@candelatech.com>,
 Ramanathan Choodamani <quic_rchoodam@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org, ath12k@lists.infradead.org
References: <20250624205716.1052329-1-quic_rchoodam@quicinc.com>
 <0bc6c957-a0c4-c0f7-ed37-c8b44852c26c@candelatech.com>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <0bc6c957-a0c4-c0f7-ed37-c8b44852c26c@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6IHwV7SRzJBiUh+SWGjJWfFnUR8uLXYkC/aqpmQnrRtEfSIY+Jj
 rj7t4wBGn35SDeQXJmet+kLnqsGGq+II4OlGsOe9kHIuAxuqGuXMxhekhVKxrTux+Fa7vA8
 V4mEYPUC9p1gf/TIIVcmGoIYr33jp/gMivJyLx/e2Twjw2nsje7PawzlslyXoZQJQHfHrGD
 AoY0K3eGJNFIps3sKhLbQ==
UI-OutboundReport: notjunk:1;M01:P0:XK2IEaG7KDs=;JfT7yIc+QjNNcDvbAsoW48thPwu
 QDsE0StAhiwY+z9/qJB5LTl9tmjveeWWM+gFjc0UQdv30kDLBcmj9R6ZjqEnl75+8GgQNCBEC
 s/LeAI7AJTCPJrdlB4r+X7ixXcBLYMAGwqhP3PwLBAkM6f21Jym09V9+LOw583NczLY891Enu
 Ca/u3hx+YfLseSAmwtpB3jEq/4vYC2bS4DhdVXTKl6l0IoAcukbyl6BTTSlpCURPwNChS2XTh
 S0qickInqm0UClondGo/Xb2JH8CdG0IYCKgU0BvjVv3T6M6jC1RjRhKnsuqW8OD0OHct+LK+M
 eBzROeigv+kjmKKfGPLSvwbCaSqLH1VDnuD+JZYfMUGxc+7O1mjpHRfihIXmg8uGC3Kz0Mu7G
 TfP00VzsbQ5ymVu4uq/6yr1MOx34sdu4i1TcmDcD426eOeejZH3eQ0XjFqLDqUnsdaWYDfsDo
 qogC7ynCJecdPNr4/W09hH5zYinMbDz8w+vTJUsrO6/TtSEcgwp1YhGeIXnsLxsrRX3mqbKTW
 eCA+AOQb7X/a8OrdI2V5DV0nHg+8+yvR/Kl2EuiWvAbGbkvlKnyVEKODYPc2N8Ux6CIIi5UB5
 TKNTYesRh3MV36QMpDn5qD+PFytO5sVtQuSnYgTSrt7JG3U33X6B8Ee0vmnBEiYVlRz4ALohE
 VGpdenzzNhziT6f10HBhIM2g19EzWO6jC+TCDaOAbkt6YiJ2wMZTrJEexrU4lTa2OkqFCeujB
 TOhQDZUmYSNElE0ZZ0+eCpkxj5KsNbRGBfuFfPhhZlY4NTQMJW8fx+McJOhYRykvx8AR+PTta
 1T4tZwi/CuzbCfsifPU9mNw54DyG8GJ4JV1WbwYCH0mosCIZ/re5z+nlf/HUh7rOB3gxGKeu8
 QCRyHdUlupiSS1b2buqYiNgfRAPJrpyt+0VZRpx6zCSv8m0q538sDcSwevHDrU+dBJSdzTmHM
 1xjrgutDUB39F+L+ycSevtVen9OOttHw+aeb6S0wBSnpTaaVu2U7Qh+h3SCqejuDcXB99LUY8
 CadS2kXi+kl6lfgyvIAYrk3MFBRuFYBosQFlgog6DTscznEF+em22SyaT8xzWB2kRvnHaip1z
 kptJ8bBdqeWWhQVd4duweU/2UKHK2872pObnOzu6b0GPVuJmqme7asW6Iv3Ivkmgo9DZR7F+l
 Z9vfkmmMCv99LO4X4JGlkmZC1HFDuozhaOh/cbyApShO3nwE9Ix2m6fQLNW26b8JPQeGims2K
 wxBLujwW9KhS6SayLpQgYgOcrmeeuBdkelBuex7Ibivfiv16STcoDTdSwc74yM32hCB2sx0+n
 Kh3nR0aNNnTLOoU0AyTlb0IZtm0hWQCFq1RxBR0roUdShqkjwaKSs3a8Q9VOmomeDS7pFVvFQ
 izgaocwWmI99ZKuFKp+X6usLUqJITCiJ6uGCoziCI6y5TWr8K0yVGKlWGHlm9X0eaEY3WzZ8B
 LlcPUiBUGjC12XrFnESS0eW7z3ORoI63lUXpf8Ik/5Z+DQtDy0QVoc5kEGD+EFepbUmgo6DLn
 ELpoqoyMHrXcXzopQUBJCLtpykzHX9eFTP61xIrlixLA4V5CoZ6jU6IDxWyw1rJr3HzDJMiAd
 g1aJ063iTIeVxLLpCBCP5LzZUfgdX4E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_025718_053972_CF911664 
X-CRM114-Status: GOOD (  14.34  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 25/06/2025 00:31, Ben Greear wrote:
> On 6/24/25 13:57, Ramanathan Choodamani wrote:
>> ===================================
>> Robust AV streaming protocols - QoS
>> ===================================
>>
>> The Robust AV stream protocols are mobile centric protocols - meaning 
>> they
>> are initiated by a non-AP STA to the AP. These protocols are implemented
>> at the Access Point (AP) to classify packets sent to the non-AP STA 
>> which requests
>> classification using action frames. The non-AP STA initiates Robust AV 
>> streaming
>> action frames requesting for specific classification for the IP packets
>> destined to the non-AP STA from the AP. These parameters can be 
>> negotiated by both
>> AP and non-AP STA.
>>
>> Upon successful handshake, The AP classifies incoming individually 
>> addressed MSDUs
>> (Mac Service Data Unit) based upon parameters provided by the non-AP 
>> STA or
>> notifies the non-AP STA to transmit MSDUs with preferred parameters 
>> based upon
>> what was exchanged.
>>
>> Robust AV streaming improves AV (Audio and Video) streaming 
>> performance when
>> using IEEE Std 802.11 for consumer and enterprise applications.
>>
>> Let's look at the Robust AV streaming protocols which are implemented 
>> as a
>> part of this design.
> 
> Thank you for posting this and for the beautiful ascii diagrams!
> 
> Since this will be poking netfilter rules into the kernel,
> is there a good way to clean up all rules created by a previous
> hostapd process in case hostapd crashes or is killed hard and
> cannot do its own cleanup?  Maybe the rules could have some
> special marking that is configurable per hostapd (or per AP or BSS or 
> something)

nftables has an optional "table owner" mechanism that destroys a table 
if the netlink socket that created it is closed. Just like nl80211 
connection owner for vifs.

keyword: NFT_TABLE_F_OWNER

