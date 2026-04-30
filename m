Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1217DCD13D2
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uytwK91gAW1pt7JYIMJ5S2V+aZdw+oowu1MjxGCXUnk=; b=2Cvpr0MEHt1fBAIoQo/TAH84zy
	fdwE7r17ZiYFhieF5RneLRgALwvwHmWgDTQAJ5k5qFTRhx4yWc/OfZoeCL8uSqlkUa6UKMcb0MYPc
	k7Gb63KE+ArDjl4rlzX/FKuhRdaJPeOHd0Abzovrv3urvJxZZcdKl97KReRKIiwroHSRqZjfNsKFO
	xzNgt9bIjgquCB2XzOV1qQbLY1Q5zXLIMUx6zKwj2esUJNi8VnhpDmdKuzAE9KXR0sBU98h8Oy4/f
	r1qLA0k7MKRzZChen6ChwSGNOLlzP/W7H9RzSzveOmrpannQLx1rkXjNVxW19wLxCX944HKAV+ks4
	0gQZGZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyF-00000005z5g-3U2T;
	Thu, 30 Apr 2026 21:30:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyC-00000005z2k-0gT2
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGImFl2122425
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uytwK91gAW1pt7JYIMJ5S2V+aZdw+oowu1MjxGCXUnk=; b=ZrGxOElOtzl8/qMq
	TJ99FpwoeourjNBU0h3OhIJWbr04dQ/YH0SrIl+u3GfdBnU/gMcyY0iQe3J560I/
	ve3VDXlp4uROwkH2dN3rnXOc0cxDhWvHMviSLTv1fp1graYmoSh1y4a3YRuUcAV7
	1cLLfWKWxcTPh+16DpBsxL5z7PRkFMbN2/e9zDSUEDlP74ppMFszZLR7/r6UfdA4
	HtWjBrOlrfpQVx46u00IftzzqzxP2cwOJOfjhvb+kFn36Idh5ut53VcBmmer2ssz
	0qsfPzxb1oJyahEXQN/wDrNFJWeRPO1oXm1LfXs4UEnlH17wRsFCtnCrcXi9bonO
	FVqXng==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4sc5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so1207906eec.0
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584651; x=1778189451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uytwK91gAW1pt7JYIMJ5S2V+aZdw+oowu1MjxGCXUnk=;
        b=NI0L1hFf0lXUYaLuRmWjOtmQCv9RP8twoM+3FkFTBbJDt7LjmLP2/PzjdAkl2chN6b
         eCYm9jRlzw3UUSh6vWQPi8VHdD+i07ayJAphWnINvxtqnRwe4x+tTeCiT7SkQRcKBsoi
         Sp4heenYq8ExF6btH+P1Mmy0eNG8wjFiDZaoycQW09kYwmESkMBBTUba4ppGa1XER1yN
         4PAAstkDq1cReFxKxA+Pgs11Kct/VBIH4zj96yX7fV/Nwt0PJerpg+Ww5k1th6qdaE0e
         2nh0aJbbRx+/M0NwK3Xklfw7oZmo+fODGBSam9ykVdOHtKnE0ZqmrGGbgg13ptQB8IQj
         FQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584651; x=1778189451;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uytwK91gAW1pt7JYIMJ5S2V+aZdw+oowu1MjxGCXUnk=;
        b=eR/PU347EkVP/bOb71qCVSM9VRTTFN3AJf0suMlKkoMMlvdYVxALzVolAbTHFu1QeA
         xAqoYPH2INwc7g8y46N+6DoN7StSjbOp8aETpqL2jW4NLqMrtcxZY4+ZFvJOye07dTt1
         wJtNT8FcSm6bDGfxKB8898DtpAcjkqPX7ian1p6OoL3+3o0IpTd0NULe4+MuLKI9Q/Nd
         r41VciuR7Idbs7ImNQTgW6JQv4L8XaVAr2Zg8O55LN6xN3yCLsv2A7wTdrp5TP25Pjgc
         0xp7B0TQaeRTjlvg74swgQt+nKLGaP7xCYtzeJ5/T0L4j3MVGIh2RAXzS6D8RBxtHsUA
         I0iA==
X-Forwarded-Encrypted: i=1; AFNElJ/6YOj0HBxGoIu8DqRPhiL/Sc4lRseP9BEc8yKEtja22Gw64RBy9/bEyr9L7cuIyEp9Io6jlok=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRRPz30a12GKlTe4LaZWZ1s63NLhNDpHs0tPTApZZRP3RStynW
	NdKBx8CRU8bKS0xzjz3wg06RHih6MDX8b7ZiaCWZtbxMSpNTtONQNTbnLb0hwtNc8lhSleFSVy9
	S60/9zfaYSJuQ+SzE0GqCNJfJke9D/l7Fa0xj3Md8Y5jSUNfuBcpVHa98KXuBzw4Yij+jKjRx
X-Gm-Gg: AeBDietxQRBUj6ebtIZFo/P+T+Yav6d2TWLQyr3QvbP1h9KC3yZTT98AGNREIsE8f0d
	j2X+iiPWg9I4/dzVyrqWgiGH/1XWpzagWBt8t2BJaQsGZIiQMfD//RYxOBQmSu4KP5snschDybU
	SUuZw5eP5KWXpvkgK70qxk1yj/0T9Rx4tO5Zfg3wxX6UHaPWNhKY1IUc8v8T8/c4Yd//Q/jx2dI
	bZwBwMSoNEEU91JRL3JtEBJJHEWrEP7Hz+4recyQEsYr9EZX/dL0s5aiVWqVzSzV3h7sqrW6q7w
	zChGH2FZzgPUHt3zjz9vlKjpW/LnwxPbCKVPlX1YJPWkYY4vxmxLDSaRPxZ7a+gR2INt3f2Sn6m
	+86PrGG0rHSoN/Hfi0QlDRMOzBUBBjF+iMnHP9FK9Ud73tSW4BLRQUKe5eMp3pf46SW3ScPrpcP
	ZqVXY8Bw9eeUE=
X-Received: by 2002:a05:7301:1902:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-2ed4e7f58e8mr1968585eec.12.1777584650785;
        Thu, 30 Apr 2026 14:30:50 -0700 (PDT)
X-Received: by 2002:a05:7301:1902:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-2ed4e7f58e8mr1968563eec.12.1777584650206;
        Thu, 30 Apr 2026 14:30:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
In-Reply-To: <20260421213544.6238-1-rosenp@gmail.com>
References: <20260421213544.6238-1-rosenp@gmail.com>
Subject: Re: [PATCHv2 ath-next] wifi: ath12k: use kzalloc_flex
Message-Id: <177758464918.1848985.900364470995895282.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ermUMBLjcxB1yjLs0nwxfxnmDkiORyGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX1uoA5WiYKvSh
 gnsOD+kBKjNANOrHtTF0W1/Iv3J8UK7BMY2lfx1NyhjPctaiVfyHIw4aPqjivL1vWyoCSeITmKF
 jo2FEY0EZvmL/nNozU4pChdZbzgDXTRrbV/cRcV1zf9UsaRRVV5v9Lc6F01dIFvM1Fle77miktc
 FtmijzEcPb+hGb9umWkDmTenJG8pKz+8hijnkQCg5+PVv6BgS8bfwrcdwWn81RPYBz6Y4cy0Qg8
 xcXvEs5Y8cF/sLQVz+j3oq9xJIT7WMKSyfLapfxUyHSmE64NMroDZxdBMi5qja51x7nTaJDG0Fa
 Z4p1KiedDeLjjHovFFJVB1QcBPltAX+8yubC4dDNMxrukGO8p4+nXetLvsJiIj15+QhDdxFqefx
 SVYEcoCnusgK5tJXu6yxyoGTG5FHUApQb78YTwHUhZD8UF8m7t5yLg3Ify5TAh/bl/DItta4PZh
 CY+su8lgHqh+mdqUExA==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3ca0b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ermUMBLjcxB1yjLs0nwxfxnmDkiORyGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_143052_214183_8BDDD79F 
X-CRM114-Status: UNSURE (   7.72  )
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


On Tue, 21 Apr 2026 14:35:44 -0700, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use kzalloc_flex
      commit: d88c3a5117c58e1d93c20a7c723a6ad23136a430

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


