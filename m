Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FD0CCFA13
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InsVCBPORlQfTW6m5W7aVsFfC1QypOVQF5HjnKV6DZs=; b=aPdoX2Ueb+a3uhSBHrXkBPgsgx
	z4NRtdGTWve8CnmCNzfYBO0EKr9pJo1Bs62aXLGYwR6LULsBkRZyFdYmmNhvIsamr53hDD7PhZZi+
	OpZpXrX1gAuV0vROxQOSOuh9OntgD0VQGL1UFgr3U6/82qA6JQ1ZsC/3hEfBFs6kkMKk1PwCpXo8H
	Q7kWRdhDKkXiCWShVMvBfB1oRVwgbakMpbJQxGsWfql7K1akTbclAvoPOSSpFzsjMlu3r3jI6peHP
	ic39YNG02DtMJlF7bE6LEpuAmUV4NJA/oIFEl2X/y5o/qZtq2SpcKmcmL9oGTK4MMnpcCCP/GzAvM
	AyWrIcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyN-00000005zCq-0p1W;
	Thu, 30 Apr 2026 21:31:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyL-00000005zA8-2wCx
	for ath12k@bombadil.infradead.org;
	Thu, 30 Apr 2026 21:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=InsVCBPORlQfTW6m5W7aVsFfC1QypOVQF5HjnKV6DZs=; b=lfsfpmeyof8nCr+LzeVXhfFjrN
	SUnVP475x5wOvCUVE5B4PuOSyAQOlVOeIWsFk4R5+TMOw/47UHmcsKv7tiwWpQnBn4Huw1j6eopCr
	IyVzm895OqrPGkF2K6LnNMk3Fythkxq7Z+NH285CNuGuKs+fm6w23nI3I5VrimOp7+n5sm/805QIW
	04VR8MuHqzmfBE3aMr6AsR5iNzBkXRGX+sb4Vqg3xP0vHTQUYyyGt4X8PGvwODjFHMd0lG31jp4QZ
	U7AaW7uerRxh1LKPev6PtgPQPuQr3GT70FbX8IG2+nF5IEb5nJi47M1aWHiRq/4tIYjB06S82IfMB
	sG+975Rg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyF-00000008B8b-2Egc
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:31:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHfJYD440820
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InsVCBPORlQfTW6m5W7aVsFfC1QypOVQF5HjnKV6DZs=; b=KFm6SUCbyYcjLss5
	ytBPh81DJBk9UwskIEwwbqSsloK9s6WhqzeDQ9QCD5HL6+Qk0lY24hR9IWm9NLsl
	qXnz+aje/+bDIlAApOhkm8CvkQ3M/n+ZOjNK3/UpsVpkS7XMOgAVtSVSCWfMcoNE
	nAFVIfd1K1uyrOnJPaApvtoEigP9LFyWNtiNMTHXMVj54FkzzUIEXr0djj84pTtJ
	YqVeZOvj4EoO5hC+0N0bNO8VAE19YgA/NbjhMsVLK2TBJfZYZ3QRNcSHd81b6GA9
	Yk7Ikz+YGMT51TMqLTTWL+WDbAnl5XGsavMj8gXM/cDs8EGcGuF8QoEgrAB2ejQe
	CNM8ug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvbpw90fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so656483eec.0
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584653; x=1778189453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InsVCBPORlQfTW6m5W7aVsFfC1QypOVQF5HjnKV6DZs=;
        b=LpzHj22wNb9M9JFjtlyJpvejhCysmRm7faJoUnngx0apMNAzAQmbalsxx570gwI2yg
         Iuas1ihiUtLnlD0fE3x/yQ2/aqRoba0V13aovAavaqsziVvAUydn0AlK5Q3fm63fZtPg
         1F6xve/tRPPkN2du0+UeU3nIqDYWBJMfX0ezKd4Jt4zyW3BBFZXjUe8da8CSRaFKI5Lb
         d8Gfih0UDlLwm6ZJk563H3enN/G+K/3A10a+klRsttkxH5R5rN7KowLI7YJPadsNC6CG
         jQ0TfQ4D12kHj2WTayMjfbg4MpveoHViCOeAtAtjvF9P44yLmc7aOVp/EoW4calbNgrC
         AnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584653; x=1778189453;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=InsVCBPORlQfTW6m5W7aVsFfC1QypOVQF5HjnKV6DZs=;
        b=U8CRQ7UHgUPrIYPREWXJlRD05JwtOG36gSy+hlFpIkpzSI7LGycmAe5hnHw8sUB9MX
         c9gfGfhC/EYLQvTwp3pxc+BJEzgMjwEwOy3K01m3EuhsIMmdCnTL5GXHz/Fpicguc5FI
         08V0r+V3eqSfoxgpeeVg3tttt2EDCHuBkhuGReFhc1vA1WI/1yfAP+gUcohLDjRPchuJ
         Sja5Idb1mO+boxQJn/lFQnHgmvZpWiXBXtLQCxQYf9yaGNbtYwJ9UyFouO101vNM6wRf
         Yux3WX9vkmNZ8xw3uLhNwjQIY4nu04sIChZT7BhrRgAQtVeHAhKxPyfhHVorovbk4vjD
         0MFg==
X-Gm-Message-State: AOJu0YxdBKNBoGRrYVAdE+B3oJ2XS7XMh6m0WldU9mTYHYp6S8JR7Mo/
	E7QPEPAhsrhf6ONk/+8q9unVlF8DcRI2aYm5lcfWY9uVbdsNAsZwADCwR9EiRgpY2yM9lDdId5a
	Vt90LYESctv0sHXuhma92rhLVnQQieUvRQqEUZsWhCDz3lSPPz96ubCGFumtH6aocypqqe/U1
X-Gm-Gg: AeBDiesJ8++oi616iBdwKXNkNnlmgo1ihtaVlBj68mWmnAIufdnyfyQOOY1K7P7ybMQ
	N1IDG11wLC2wnD2yYtRgyxKjPRSvZQLrCjH//PW+f+d4GnQqGAfTwv3CpdqyLbnMzZmaU16h3+Y
	K8NWykbZSFuWhfARZxeCMmW8HQmP3K3WaorjFtAd5+XDpi1AZwWbhK9oOEtiGhkHcXwkDGcnoje
	XK1sireQYuiUcXlizHaU5ljhW7RP/h+3ThxLdzJ1uaOkOh5h4niVI2mIFozR8vmURevJQ24fQXb
	d2Jz7idhJJZS3Td8RIdfwbx6a/aZm5wKhpo7tphLuvoih9VwHea9gJP42UvfR736gIhZwoir9XZ
	GkGNeIa3rIbxVMPObG20tNRAFzegW8Kl7WhRRhq7UQoFI4M3lfBsAJGCmgydHPzZW1R1JfAJmLp
	4WgyQ6sMmf6Is=
X-Received: by 2002:a05:693c:37c5:b0:2ed:e14:42ea with SMTP id 5a478bee46e88-2ed4026af5bmr1984562eec.35.1777584652961;
        Thu, 30 Apr 2026 14:30:52 -0700 (PDT)
X-Received: by 2002:a05:693c:37c5:b0:2ed:e14:42ea with SMTP id 5a478bee46e88-2ed4026af5bmr1984545eec.35.1777584652441;
        Thu, 30 Apr 2026 14:30:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260422163208.3013496-1-nico.escande@gmail.com>
References: <20260422163208.3013496-1-nico.escande@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: unify error handling in some
 ath12k_wmi_xxx() functions
Message-Id: <177758465153.1848985.18035614068901267062.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dozrzVg4 c=1 sm=1 tr=0 ts=69f3ca0d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KE8VTcUQ_TpmJMKzUYYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfXzuKPiNyFBbQb
 cPA2sdhf2tOwjE+CCZ+F3UKZh4Aa9Q/HIefL/nnXWLZub2wb1GSyMDrTsYUvmDRnhPnoPu4c+Ai
 eC67TIzDbXDPSnpH/J0Ax0DBM1GIhmzkN7JEfD0lxXITe4jLqcsdfHpx2Ku89UMxnoNsi3UMOLd
 2oUy81BpqFJM9E8bOYvlVfWjLh/7yZB5ISnBW9Gzn/vlCXfBvZHLCg9zNDidFsKZud/yKs7QAmz
 SehAU1EAlLm1n+3OzXXA/mfPYgek48oIVjOWQJJ4Ovm74iev+BRwZmwX0Z0TtSvw/rTd41wYQFa
 nsU512UXWUjdzcQvMc8SWHkcysecPPWwgfP2LnCOkFO6nATOLqwG/KvyOzN8roAAtfTw4avvsMr
 91L0swd56F/3/iP+PvOd+DUAbf+bc3hey+I5crRU9aFJeH88EhgqqNzG+hjG6Dp0aCu2pw2kaB0
 lOFX5GAH7rVuqqHK4Zg==
X-Proofpoint-ORIG-GUID: YYwvtG5UqO3wZa5yGY5exvoYbhW5EKHu
X-Proofpoint-GUID: YYwvtG5UqO3wZa5yGY5exvoYbhW5EKHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223059_000259_59FDBE2A 
X-CRM114-Status: UNSURE (   8.29  )
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


On Wed, 22 Apr 2026 18:32:07 +0200, Nicolas Escande wrote:
> This is purely cosmetic changes that simplifies & standardizes error
> handling for functions that ends with a ath12k_wmi_cmd_send() followed
> by trivial error handling. Saves a few lines of code too.
> 
> Compile tested only.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: unify error handling in some ath12k_wmi_xxx() functions
      commit: 31d4f8d427f2b9e423d7e177fb15f934cf0e37dd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


