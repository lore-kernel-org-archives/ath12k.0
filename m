Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D616CA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=; b=WybiQjnSgSGYNBqJhyI4lA9jbX
	YYEus0/X5tAPHuHFJUqhqNENlkKN+FHy/I8UDrCT2q3vhnBVsZ6qyDV5l87phEBuqehPi/zn1pimN
	xCm2FwuNG1aD6lqf/EWNZARgvDSwJPyjr8WKicauoLpmcPJQim9hGE3lmjEQTd2EsJa4ZqsETsgeR
	wmkLtiY9CBs8sUky7Mw/+prjR/J+Y9eorR/OuUNiY+s7VX2AoXlGEOls0pWv+ufRlt7NK79f1OA0V
	Fl33MucMM2E/U34ViHKQpFxPQgaSGUM4FdMWY/L3IA9e3wb7S4qYvjKpePbuYCTUGypZWJTw5odAF
	irlEBUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGoT-0000000AfNN-4Bz0;
	Mon, 12 Oct 2026 14:15:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGoO-0000000AfMP-2Luu
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 14:15:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0aad2679915
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 14:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=; b=ZDjckY2L8vr+JJ35
	7MvKR6g4V1kRet4H0ExeEU3lMbaADfgQkJn4efZjxU5P1d34Xf2f5HP966oBLJJq
	TOnlRpDYB1xHSd3vYQ4XFQHQjQLqp3tlId/yt3fxc+fDEX0uekxnBwrJJ4HRmxIe
	wnmlIuZjXjG9q/wLzrDlAbvDPzyvBEqRP+YjyoNx8RDvbLWyajPVZmIF6vTyhAXb
	m+GNOtA/8BGzzsF58e2Nzd7XrV+YjApKVOaKNh/0oKzWdBub+5fEoXHk1IirNRQB
	8YAo9eSceaofn3iuGUUgq0Dlb4XqghzFDsFaFn7n9tjO6Ndgwum4SyVdr+I6Va8C
	7A7+qA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tb0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 14:15:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4059154eec.0
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814530; x=1792419330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=;
        b=ZglP3iZZ8B1HHlQAkRMksJD/1Lc3Rsp61zykhwz7tTMQ7UToYDmAIFw5xLobZ5gVuf
         UmXUWzwmri178VgV/qJH+v8ZCJpjfkmFuu1WAgocSQQKWgY/mMEwnFKwkaT9u5/02FET
         2tWSM0uAq4yCxkKolJ0KpRho/ujGHO8aacwedBWNzw2tazGxp6cR5xza61edDk28ETf6
         ymrx52SoxRiKc55ehlQTFU1T6XzDt465R7/KCq1ZZhAzS4UmPeFq/MEUpECD2Se3Rf1k
         JR7EzKtIbTwtUY4mXMGImWONETFA017cuIpLZq7JPG2t9rxINlVQGpvcdtwAxd2q9CF+
         mzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814530; x=1792419330;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=;
        b=IcY3zYxqKdslRF60q6GcUxV7srkmwWtUfdV1DlCLPMPTKie9JmQ6fXGAUTFAJKOdBE
         TXbzHAgqbUiZ4z3mbyE/2c5x+V97vWppbRsGthqx9th4zpkBryOcrVuJWgj6v6+7QsSk
         dLt5NeFN7MDWPb4ZmrHor/hReSs0BzTwlLkfQzq3Am+/GKoC9ksffFFRGdtiU7CKq7HY
         5r6HHqlTG/9l68rCSIsPZBBeS92TBwtSFPyzhNxLr8hvSWcR95hXrtoitLudsytMlMv9
         EHLCZbftdSlj5lPcj/QAgLZlCCsddPuOJJFiHrI+FbSPOLiw6X81Nd5H6sMlk9taqDpM
         1ntQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP6HTOa3c2iDAT4o83mEGhU8QcPCZOkD5NmROP9ygUjYDuwqPgEkEe4whFP0VItek6YRSNtcw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLDwP3eDjR1HFbcwtGpQBef9xk+R5NLRX7a1u5oyAtbANGCZr7Z
	Q6zO/h+v8jrUcS+SQdS8YKhySN6Wg9W1iv7z1kFzyqoCD8fHV6J7sBHxc5EQFQhGvt/7XmWKQuf
	Cau3FZEhiYoQW5aFU0ERtkwyFSfTW60MtPKQp+vnJ6ab7nZVJ0UjDbSf2BRqjqIk8
X-Gm-Gg: AYBFou0fAr8zaobvVV59Y5Bxu4sUowf5dLKi2DVlkLFJDeKZcc/aBVGGZYQCdxrq+fx
	tbtD8iOPRnY8c2MwxxTm3baVoqNN3bkjAGlYfzwo7gUtaWBo4Jd18SrvGX40KlY0QiYh/nnXknc
	6u4ciKX/y8r2bOIxhzXjSzw9Et8Lgm2CV1BeJW4N4X66tlb3x5FZxYpZeiQuMcjfOWXIbm8O4vr
	ROTABvkZE/FhgIqkQYC6OwtpIWukbUcVAgcvgTD4qGqfPQazxY4HXWr0erMB7gvo+FJ+scR8DPU
	Bp8Co/fBBnsi+8vl4tspqs5WhwpFFyAcAPaUIZgYWCY3p1L2Jc8tKnxBtdvaey/NF58DVX1faMu
	4cJoCpAX+kI//yiPEWhjkoVqkG6hxC691UDj+CuebH55avDzisIBYXSSuYDBCVw/C
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr3312628eec.22.1791814530300;
        Mon, 12 Oct 2026 07:15:30 -0700 (PDT)
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr3312594eec.22.1791814529564;
        Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (las-colo1-bdr-fw-bdr.qualcomm.com. [129.46.96.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm21302992eec.31.2026.10.12.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on
 Microsoft Surface devices
Message-Id: <179181452875.1215069.2287645106143483581.b4-ty@b4>
Date: Mon, 12 Oct 2026 07:15:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: 1nrEKcfTf-u4Td9XT9r8XS7RjYA6VYzC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX3POxpTDvSeGS
 WeNm409D0AUmbmVXkzHUjL9BdwXof0aahsXfyNBtY4aDFnt+tZMq+u/klzwVkY47dp6ECFCB4kN
 +cJ3AlAIWMFvKHhEFgcLawSyGcB3IPM=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acceb83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=zwy/ZOtzXhWWzLhDjT6TXA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5GOfUL4nasl92P49FscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1nrEKcfTf-u4Td9XT9r8XS7RjYA6VYzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfXyFgV6Lqc42cL
 akSN16qZz7qfkUyp0Dl/MKg3OlfIlE4eAkSQ7LS8h45hXYLcXzH96jLoKWqI/EXqfJeAIw5TyPH
 guHT8fYh++C7k4DKaheDjIJTV1NrWPYLaosOSv2U3HGK5B1Tpe0g89aGMentba5XrDWnfAVgUxI
 meB8FnfyYUGGnXrj2IQopGeqcdsa+hJNbtHgpWuzCwcZ1OBWkM9zXqQdb91IvZuTJt30Mf45XJ5
 yAGiAU4NIeB6DYpGiaypE13IEnaudh9iZiOvunNVt9pryyxjXFGMs8GNEGIFkEBNIaVUCr3OJ7q
 puiYsqgoF7mmO23feC5p+lTbnnKzoUgzE2z1oNcuCw+axEkt7hgM/Fhe/vyn/07YoJTmqkXh0nj
 clqpV/7hQhfsfcjJWt2ZjiqpLELurSjsxzGKC0pWHxRMruAnOJLdhupF7E0riTROmVpo1gJR7JR
 /avHZYel74ZS0yBbWVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_071534_580891_D661B341 
X-CRM114-Status: UNSURE (   8.28  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Tue, 06 Oct 2026 08:27:28 +0200, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices
      commit: 5949d1910f13c20f6ebcd26eec9e0c02cb4951aa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


