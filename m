Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD69EC5AE5D
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3TvPInWz3YuN8P66pTP8LjGc5w0D9OtD5LRwHcHHwI=; b=exZZ+VFFn78TmErdUA2oymusPr
	Tv/AKyUZ/dnz5zZbKdoxowYmP3NWPQiE+dkn9MoPmvfldV1mOHeGOUWKq5gwNZtSmll0/7hIiE7iz
	X7oPSZMMGQF3znIaCVOHVN4IozG0bCLvsrflSzUIbRct4RFawHbJndJ+oJqaMwUKYH5LvnCOkb6Me
	jbeT8yopCun8PMjHNexYYYmVba1gME6Y1qua5yeXcVduPwqMhjyoDR3BD/31gS9f2r94/idD62ehi
	rSfDMz0emS5cr4qQKhTrAGbf5jcpVU3zDd+J2J2s7O1UP0IBC9dpKEZ0n/xh7ywy0IYvWOSzqGZJU
	g6sqOZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNYw-0000000BXsg-1w8v;
	Mon, 10 Aug 2026 10:48:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNYt-0000000BXsL-3GMr
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 10:48:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SCl8446674
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 10:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3TvPInWz3YuN8P66pTP8LjGc5w0D9OtD5LRwHcHHwI=; b=bGQHD8ozF9SOh/w4
	dX4rgBt6DU2cYkJyGusiKPaKqXAE/WyDS39Du72MnABBNcXcpgG29O4wrxR0+irT
	Au+1BEH7I//6+lVPiIRQWZMN7v7POT8LIJmr1B3IMaZN3vBdgjct6TXYL8q+13+g
	GTyFXV2VAoJ8a3o0n7TyiWq24gR3HoetFeOpfR27HsdvQCyz4WEQyJRjPa25kSys
	iV3heqt/baQUCFk353cVC3q+MJ+1QHelR2HFX6WMuAurV24F2VswXLIcfIIQ/A7z
	S7FhShvqITHdKH4qo4ZU5ETE7IG5Hhe3oQj74Hy3xK+OJ41xlxpkxqOQWQkNd/bY
	Mw+kug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v911vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 10:48:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2775229a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786358935; x=1786963735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3TvPInWz3YuN8P66pTP8LjGc5w0D9OtD5LRwHcHHwI=;
        b=AfEUktgjuUF1HViKAUCfry1NYYuw4SPas3hbW3sJoSltGZTYQIb18wlxULxPMZPLtu
         ldQSuKknDoap+0w4pSoUlbcNXUSftyNNshe+5U+P6hw/FizirJDVCB0XUPOioiWv4J1t
         OEJwoCwaVl6R2wyvFka3fatDbn78Y6/gVrLk9uYXzO0ofxDY4KLhVZUqn9F9mzBHdVFk
         TFavHScV/yPxYVEQGocReaPLlnNzDKaHyZfQ43fX8CWaJDsdH8M0jennalEwsp7sAI16
         WRSBnMWvWAk/ENwrDu8bTPrWRhUlLw0rLYmz/vIEJMKAijbqKspWNn8OnGN+rrzP4yb+
         Iw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358935; x=1786963735;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3TvPInWz3YuN8P66pTP8LjGc5w0D9OtD5LRwHcHHwI=;
        b=Sr/JGU9GpGlcgUIJzIW8J3ZxdN+jGbe7zcUws1YxEjVybSE5HZVdTnD0Gz0iSysJVQ
         tGGC/pbzcqmoe9lZLMVd/OiqDl5f2vxyifHFNtIwCE4OW+gCG7xWfIDzPrOuS7spnD85
         jYPuKZu0cyQ6I+30emdvrWfriIBD26infQPFKjZctReOtiHhC3zC8X7opUZyrmEDgqTg
         dlWvQDYZpE3Ylvyx+Z5IS4gV1Zhm3aPm5/pF6aKFGRalIh5kPBknJzePTYAXdUSSYL5k
         mGby60K2U0PndPQWgCrEPm8ztDk7Iw86FOfNw6oJV/WSQoV9bqlL0ouBoLCiYxN8CdyH
         OH8w==
X-Gm-Message-State: AOJu0YxhsXejzlmb2clqDKryOO50/h7HAj3vmad8lrcoDA3BbhxohrSt
	KEwkQUOOcb0BgBKuVw7pV5Ed7ijDDZkQFwCGqcDkYUIFa/xhFbiXMxD0DUlSRCH14yCPO3qE2ay
	1Zq543Xu1uGgLxjuUztaAZPhaRuKf/KJ1E3TK5939w4KKTcfs+KljYg6lQHl4cBY1
X-Gm-Gg: AR+sD12iMZ1uMC0BBPZa9fNjh3o4V5oqONcD3W0HrnE0/RXnU4ke+tM1CE4cOgihlbX
	hg8Ktsm2jHAHrnSpP6UAuVCTeVWQmniQPDWIHuoVWaxNihCsJaolTWjpKiFar5P8hm2XPy50NEY
	4A0gkq5r9AkhIKFnxK4oMilu+umhEQhkxlCJHjJo8OmHHKZI7FH0hBua1h3aPTMhWGLf863ehzn
	d8ZORK7OoK2PItNhy755dSUyWVHr175msq8GCtyciQbtEi0gSykxjjySWsOf6+S+FS3X1ukLr6O
	XsS3U8F8X5uA5pgG7CUiguprwNJnQeqlkrtHBh7wnwpVLp7p1Gkhl2vZ/gX3D9sIXSVGMeom35F
	3klDuumzlW9B0EIC8rhCMg0VqIFUeE6tRwl16dGQE
X-Received: by 2002:a17:90b:4ad2:b0:38e:740f:9764 with SMTP id 98e67ed59e1d1-392ccab2142mr293470a91.18.1786358934716;
        Mon, 10 Aug 2026 03:48:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad2:b0:38e:740f:9764 with SMTP id 98e67ed59e1d1-392ccab2142mr293391a91.18.1786358934218;
        Mon, 10 Aug 2026 03:48:54 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb87d3bsm44052076eec.14.2026.08.10.03.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:48:53 -0700 (PDT)
Message-ID: <0cad6db7-ecc9-4051-b47d-148365d43ca8@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:18:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused
 ath12k_dp_rx_h_find_link_peer()
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NCBTYWx0ZWRfX1QG+Jsjt3LeJ
 t/pMJ9byAGqtaP5BGFxtBGNz5BtAcXfrHW0FLIi3lil0Aye60ihgRjHo6gnCEOYEXbkDIoZkoXZ
 0aUxyX8tzBhuKn3vvAcuJhg4100MdpQ=
X-Proofpoint-ORIG-GUID: R0e3Rk6rB4g7UOofHchZNSJXhgFyFl0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NCBTYWx0ZWRfX8ELWzquEP5Mr
 a9IIlDSedTY4txFlzORD1zSWA4G7SDe7l8nJs13DbW10d609uE5xc0+CFZSN0jyVFMnFMse4v7B
 RQCv3cOvOdY9Q5IrRu/8T7zgXeTVbPQ9XfPZk9KVX+iKBc8buhZ5V5v35FaR0fAcHID6/x0+3y6
 8M71LDtA13SEv+e/7RS9Y4Tr6LJimMN/YA2CLTM5EOVvqmuiNv64KvlLso0LhRbVDRzRKJLQW0v
 jkL5UkgBVAUndMHX1hmDX6ExFL20SG0s5B6D2nqBR9UX6nAQ8prEK5P05KrLhfZvUGp11Cza52C
 NQeqKu9C4qNIzD9NWw0GvamdQOVB46vvAaRK3Bbem9/o48OP+UsTjRZGDQ5hvQFqZfQhebYY+1a
 KX3p/GOzkK5IKrSaGGzIhHbOu8IQ9IZONbL5Wu6ho8z7fHbsbBwUZerLtOTCJ2B9+UFzK1+Sal+
 UwKwFMLax26YsLrboqQ==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79ac97 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-fi7bus0BQzjAAfoSv0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: R0e3Rk6rB4g7UOofHchZNSJXhgFyFl0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_034855_823314_23B2D1ED 
X-CRM114-Status: UNSURE (   7.27  )
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

On 8/3/2026 6:35 AM, Miaoqing Pan wrote:
> ath12k_dp_rx_h_find_link_peer() is no longer referenced anywhere,
> remove the unused helper and its declaration to avoid dead code.
> 
> Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>


Guess Tested-on can removed in pending if needed so,

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

