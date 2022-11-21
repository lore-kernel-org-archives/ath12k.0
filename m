Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00432C4332F
	for <ath12k@archiver.kernel.org>; Mon, 21 Nov 2022 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyaJ5jnJ6bBs7UvcOOecN4zbDtGuObVcW4JIDaG20cA=; b=GvOaz2AQRJ3FkA
	jEYjAeSy/NUzaAgy1DEf/J/b+KD8oBymFiHuAZjLOS3Piv+YaftuhUcubCfEdFRHtZWpraSM2n6bk
	aOl30EF9ZJTkscnTEJKORfEgM8/mH8hXzXNRsZ+uRKYBC+/A6wcwIUM2JzVNa6SJqkYgVLjSwNxR5
	9XHQyL9eyx0TH/K+unVRZBPisz5tX9YchP/SdMYgVCldT2G/SmOCbhSl03zhYT8hUm1oahIe9rPZK
	qxFKvZROMemuTzcycQyRAFECUNuUpnq4+OqYA1cvJkeDayvNDYgdHsDv3faQDF0oy9/0KzVHFxj33
	ztvztgmYVYhb5wWzeHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9dn-00FlpT-Dl
	for ath12k@archiver.kernel.org; Mon, 21 Nov 2022 16:27:27 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9dl-00FlnI-5u
	for ath12k@lists.infradead.org; Mon, 21 Nov 2022 16:27:26 +0000
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MxYT3-1p7pu93MN7-00xwMo; Mon, 21 Nov 2022 17:27:16 +0100
Message-ID: <daf6b5bc-fde6-d0a8-84eb-61e16a3fe69c@green-communications.fr>
Date: Mon, 21 Nov 2022 17:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
References: <20221116163902.24996-1-kvalo@kernel.org>
 <20221116163902.24996-42-kvalo@kernel.org>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Subject: Re: [PATCH v2 41/50] wifi: ath12k: add reg.c
In-Reply-To: <20221116163902.24996-42-kvalo@kernel.org>
X-Provags-ID: V03:K1:nQn9gpfcW5AQeiFw39JfTVAYYfZPpyII66MLrA78IZfMQ4aKIxr
 9Z37Sks4Wzcm99lyCilXiAe+X0n+MZo8obfNlJSTCrc/tTkVJYfUMLvi/G3WWA1KuTiWw/P
 ShzgEHQfYE4meLrIqFsWvJzMYV2SO08ptsW63bfC+Giwx5FnkemmOhKcd6C0JIAh4W+eneh
 9DT10SVMCp0ok72pEWbsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pu0v6hIDJ14=:05Ojmu/x0ASu1M8qRtMmoc
 QcBsQ5yqfkOlq6HsLk3Xa1TbuqG7DYDDBdko0InQrqfDodMamz0j9WVu13W0QubnRiX97WOmu
 lWfK3RNfIc9iFaCl9WkEtqq1E9PqhEXyNXPVlZhdAoUw8EHl44ta8wSTVAuU2br4xoh65to/W
 J2Wy/6ZEk8143Wcvk/5SRAmAAuH+5tZH1vF0oUSn3ZeJKKtX5gMKeY1KPruycKA4odmYY2oo3
 eLg3u1yK2Ls3LoTJczTyxsosGzhNYO81BCG4llhT5Lhs3tWDQbfZZ++u444uyIPD87X03yqdx
 GNFDuigT04lfrvySdGc/cIrqOOjGnWKXbnUXE3UruRO8Dv6ihs4G6Vl0cL6NhLl1giqr+xdQy
 eLqjCctRbAJjy4dsnRKClKgXCNEe2X+C/SOsxEGltoWQGlqgoF+K1xiJDBmpgV65tlSkFjSN/
 e/KGbZ2aw4wyBI1RfL6qTUqiQgAeEJN2kmtMgZ05TBAms6gwJjphpun1tnGhITHz+J85m4hWj
 JqdyA0oRW/vs0p/PF6nIi2GYIknOTfMLmoRvScKnAnWhrmzaOHJ7H76xkojzFhtAg2UCuDGIx
 qKU6iGeT0ER3L1YYPuUozs9kRrQ3gP2Q3wZu1ZyNrPE1XZDNxVjslbUOkNheDL+czrxY+I8Sj
 ikIaJM11dcmDTAbC/UXE4hgR5scZTL02Wu6Oaa+pPfEq5YxZWq1tVaojQx8BP5fPbvoopsLzC
 0INjy2C03x7wXIHcQps08Whid3GhQUkJU3rVVEDrQJNIiGa+LSvMaqXwMTjd38uRWh5iR4lH0
 qE+f6DLe/w1BH2bzt1C2pYehlEMYfxtSglKTXQDs+0Hkb3K4As=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_082725_527371_649140AB 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 16/11/2022 17:38, Kalle Valo wrote:
> +#define ETSI_WEATHER_RADAR_BAND_LOW		5590
> +#define ETSI_WEATHER_RADAR_BAND_HIGH		5650
> +#define ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT	600000

OT, but maybe cfg80211 should be taught these rules ? it is apparently unaware 
of the harsh ETSI rules in 5600-5650 MHz and this affects all drivers.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
