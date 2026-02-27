Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C377FEFB6E
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 17:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sCMFWHlvz+lbH0QqSntyyBEL8DzwJyz9HtkNf8tZ3Q=; b=Ibq0pUKCVuBCvNy1ucw9hV0SVM
	xhHy+hhg+1qdbchVNQe5/joH+dCC9JnDO5lg/nhQ/Dpu/2MJovYY53kDE2vsVtlu/ZUDNbGmoKpI0
	5D+RZOPxjziTwWRAtJ9VH/mqzO4S9E2tq7rr0j12Rncp652o1ht6HRYdITWw2Fz5UXOi4Lqg8aaOS
	ZTGCNzbJAic5sxfWMhc8sLGo+8ERSiKB76GWgkyO5MiPx3ymtN2oBACUlgZfw++zVIWEQMF+5ierp
	IX0+FZy2nd06ixpGbirhUizoZO6j0VaCELSAK9gTZz9SxfMI6sbs/oPg1OaeFL4r0rxgelD1dwHNI
	0/cbnEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25o-00000008rmj-2GWD;
	Fri, 27 Feb 2026 17:57:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25b-00000008rYa-2CO6
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 17:57:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0F0T1912403
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 17:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sCMFWHlvz+lbH0QqSntyyBEL8DzwJyz9HtkNf8tZ3Q=; b=U5VlLQahF79zpRqi
	C6Jrv9zI43Tgvi/+lomLn4qV2drVHlbrai20z8clYwc4Kj6gFGDQgHS/TH7a2gQV
	IgmqRi1v5QEsldz3cGT4LFLR4a+89knJIWB2NG8KGB+uNMfaeku2sN8Lx2eHCe1W
	IgkY9cf4X3xJ0zPFHnoH03XeMjYreK+zO4ePmlW5eHaL1Z90gjDGrZhYxCxBcU5P
	uGsQRxwp8qq9+v1gZMWQ10r2f83mAcRs2v+5yQgCIybCvC7Ino/wKkbQ+yQ7hFLD
	AZV/5YjR/PFtMQdcpyuFPmv+bO2bpT9AYhdr49xChtAqp3ThGL4y1e0CMGjGP8iV
	tafI/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur40xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 17:57:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so1208468a12.3
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772215041; x=1772819841; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sCMFWHlvz+lbH0QqSntyyBEL8DzwJyz9HtkNf8tZ3Q=;
        b=TGeTaAOY5qs8LxMcRQaRwDJgPWsMz3JmAmVtpNLKm/eXgTqlr6hlUVFzRdba4UdaWQ
         B7Zho4MPMasSBtenx3HTkm880qRN5kjUQWYm46cDXXVOYMbdKtEbih8uxQyU4Qcb1nC9
         jjqYn90k4J0+U7MlAO7eNQLVh3LXWTNwhtVUhOOu2W7UEfRO5hhBjWWOV2GOfZ14ke78
         POD4+S5BzAPLPnNx2fskmkYqroOzUf04MmlG068m03P2dL9UdLxMzeuiA98paX+hty6b
         N1jznAlKMNQpXejaiUxWHZmb8Or8+jehf8FtjKetg40lAoCfHCON0/cH4rVA/VIMzE9x
         30CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215041; x=1772819841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sCMFWHlvz+lbH0QqSntyyBEL8DzwJyz9HtkNf8tZ3Q=;
        b=nAvlZmOwC3sLzUj54VMgE1OyLxE4ZGrPDZTj5/3JlXO2Sx6/dXo2MU97Fi5U7Q9PYe
         I245VW1+svuACiP6bGEx5HiJ7bSswtWsBzIzC5JapVKwB/zEC6nFD/RUxHd1vjperE6D
         qwpnVbUVGsWWnQBnFfoqmsu5mGhSpeJjMd4ss/5oCdm5Y0yA1ySSVdRY2T9ukmlGv2Od
         dvAqKB879qVd9e1ZsCTULDNZw8dzwX2+3xpZGfOGFGCEg2Pss9VqDeTpfB2KiTGQvJw8
         p8waxwpMUKplpz/UMKDqjWuSICfsD6jOzMK595Yyw71tY3Y3ybUHcMLWeaYVNMOmGVQu
         aPAA==
X-Forwarded-Encrypted: i=1; AJvYcCUMS4CTwFgG62OM1KbkTTkRBidccZwGnYcc5vv9tKYCdJPicAC9V2bcqdePncPdtnPFnP5z2UQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ayN0EInLIGn5DrkVt2CkVf7w5OATB7Sw9dUeU3sfMrxMsK4s
	NdqsuYq+oI2u/oddBqd058CRFX/yR9mGtCHaqwIZwpGKBMg1pOt26PssSVO7vq+XxzrpBekVHAQ
	7Vabs6bQqiXXgAQFQDWv5FZA+HYCFZGGTGtRsVEKZPujL0JYz7rD++4UfH7ptZzgH
X-Gm-Gg: ATEYQzx876mOnZspooMnzhVGMKFvCt9mRdChosJ1GIPvhwfRSgxagYEb0mTk6vPB9tX
	9xrU+Mn0I7bqwa2OElBoQe0YNTJ+acMOVY3vqvJBruQf9toHdt7VDZ+m2AgSWve/uxTc5lF+tAf
	huMqjyzF4DsZx5mSJA6gQ3RnTVBdJG0OockLixAyE/1vGmvwh94YdB2dd0SMhmWTnZemjyBOQSr
	OXnHubAB+B4c9kBKSJQ1D40dvTzJsg5/dPcE55sbRcaSFBazpHMsVoyLeW3TL0Ph3BsuIwzdN9G
	AmgE6HL28R9+syNwBBFzzrpFdDwU754u6Uu2TauOrTDQcfe3su5p6EgmlrZJPCD/McTEhzkrEFh
	i1D4QnHpzsqxmewz5vCayh7zEMcdyHOeOq+zB/sBZZDqHrX7hZydgUSQ9bHvECzK7PHP0EEBLrQ
	==
X-Received: by 2002:a05:6a21:514:b0:38d:ef23:12cf with SMTP id adf61e73a8af0-395c3b4d467mr4418708637.61.1772215041329;
        Fri, 27 Feb 2026 09:57:21 -0800 (PST)
X-Received: by 2002:a05:6a21:514:b0:38d:ef23:12cf with SMTP id adf61e73a8af0-395c3b4d467mr4418683637.61.1772215040780;
        Fri, 27 Feb 2026 09:57:20 -0800 (PST)
Received: from [192.168.225.142] ([157.49.228.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ef857sm4892615a12.7.2026.02.27.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 09:57:20 -0800 (PST)
Message-ID: <b8626b5b-7f2d-4f00-aa0d-27daeb5f971b@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 23:27:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Pass the correct value of each
 TID during a stop AMPDU session
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P-yTsFf6dAnEgo7f5d4g8OhJD7vUuNFy
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1db02 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=PtQaxW6Z2JPlFy30ps15hQ==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bfulyJ3BcDXNzwfwHewA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1OCBTYWx0ZWRfX5MaROGx4I+jF
 I7ClcsolRajdhMVfz7x6vQl87ILwVyoXbbuHJO1RfsnUTGjh8W+stxBSlGS9UPno2AixOGmDIIL
 XccuqFd/TCbGYckrC+Bwkm9W/SpxgYIoZZ7kLYz5YJ5dTeieMOeKeWvW36dNijK3aXzILmYD+Wy
 0kfKcjF0fZXqepZAClgYrPMpAJI4GAB1n5SECqmY0TcGh6rOQdMFLOiiDzXIy4VdoJ21WDlKrmE
 w3rYqaoLTNphyx6hzcg3BIpwYfhTxR6ZwioH5B3P1wgXGf0n/ySyhJxr2RT1k2FY9svXifbVakk
 NKsK+LPXDJ9Hbs4/tnkMFiBCr/qJJOF7S/dJ9Ub0CaUqRDj1Gw73KosGOak1r1TYUWcZkpOgzf+
 cyi9IgwVg7K+G3BOIi4FVYwRjAaIqyvZ7W7htQgaeAFYwSnTwn1C1wlL9T9/PUMuGGLY8JQmPpH
 b+cDkgtPlhdoGLoKcuQ==
X-Proofpoint-ORIG-GUID: P-yTsFf6dAnEgo7f5d4g8OhJD7vUuNFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095723_772798_6EDB3BBE 
X-CRM114-Status: GOOD (  12.48  )
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



On 2/27/2026 4:31 PM, Reshma Immaculate Rajkumar wrote:
> With traffic ongoing for data TID [TID 0], an DELBA request to
> stop AMPDU for the BA session was received on management TID [TID 4].
> The corresponding TID number was incorrectly passed to stop the BA session,
> resulting in the BA session for data TIDs being stopped and the BA size
> being reduced to 1, causing an overall dip in TCP throughput.
> 
> Fix this issue by passing the correct argument from
> ath12k_dp_rx_ampdu_stop() to ath12k_dp_arch_peer_rx_tid_reo_update()
> during an AMPDU stop session. Instead of passing peer->dp_peer->rx_tid,
> which is the base address of the array, corresponding to TID 0, pass
> the value of &peer->dp_peer->rx_tid[params->tid]. With this, the
> different TID numbers are accounted for.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

