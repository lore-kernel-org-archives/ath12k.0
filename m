Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56394FF885A
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI1oH0A4Gmbi+vXczhFtUqnJwavLiVD+sTVtQ3oOdBE=; b=kel+oXIKUAb+cR938492fBbQbM
	kqrWCPPzNLI9rw+YNkUe5h/UCjWrTq0rG/TPGIhYv3B/nRQBEHHpcmKv78Bn53P6StlnzAD2X8ueY
	dMqf+c3QTtfBBL//7xUmqmrDVoPaO3h1Igc5NErx5M+Z3Rmi5H/CVgsc5IFH2mFiVYqUe2v6S38zK
	91V7kj4zFNoTFdhQQflGPopKyOymtP6uxdyHPbCuctGR4X938epQ9bfPrW7AyEgaxdp3kxtXZYPx2
	7Kf1lzYK6XqCr0rDdipa2gtR7x221z5Mom8oxmZBe9JPmVRzWpDTigDrGGkHL54/SztQpnWXF8v3T
	Qn7e5gkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuAj-0000000DQ42-0Me2;
	Mon, 04 May 2026 14:21:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuAg-0000000DQ2d-1KO4
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 14:21:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B44Bh2850229
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 14:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xI1oH0A4Gmbi+vXczhFtUqnJwavLiVD+sTVtQ3oOdBE=; b=QEq8k//7Bf5Qbvr4
	ejhoH5rg3YorG8Zr0OtO8IHBSeBCKCzGg7pfChR5viweStmS0lgfZwJOptJVbmo1
	OJjI/97AoWoGel3AVXrIPOMLm46Z8IYl/6ayW4gFCtlP7B144GhbsZWyzyIWeMUW
	4Jnv8hagvHyYO//wP9GA6xlE30bzUywKrP8LdC19L4Oir0XjNrhz1vXR/h9kl9x4
	2VKjqxxW9bI5/cr9hxr9+Uqmz3cLj95f4n0OqAryVzQT8O5/PvEI8GVEKRKLGDtO
	uGRY20axQahHXaUNnjA9dDhwURMW+9ED/ZIKzlfyv3weSBCEBGSVd5WQ3DgRladz
	EJ8v0g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1bum4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 14:21:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12df9e440d3so4957523c88.0
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777904474; x=1778509274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xI1oH0A4Gmbi+vXczhFtUqnJwavLiVD+sTVtQ3oOdBE=;
        b=ZDcSu0dYTXkMNEgjR2CXo64CgO+qnFpw6ta8go2EEvTHzmMkZxRSQELcw6G9pSuPKt
         Pjf6JmPh7wbZKCKhMlDmBBZF1DEqSQNG7Lj9GguNlghkVaD2ik2yZcGYPgGR9bek6xnC
         lCuNgRM3nMGfE1kp+3G1GmTOktaXl+1m49oWynLwc7RRBM3zI8B0j0z8dXKUjlfvID7w
         cq2NsTt1ihjiprCTfDOn+DKb4pJQrCajZeTM6BGgq1Vrj5RcgCfh4HE1UTG8MYCVGOm8
         2Gc9VPKZLwgRLwYQ0Y74XT+iy1ds3sHXVvqmESnTlXfdco+uJCeq3VYw7+/4UJvZLoLY
         olsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904474; x=1778509274;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xI1oH0A4Gmbi+vXczhFtUqnJwavLiVD+sTVtQ3oOdBE=;
        b=VAZ5Ukk81jBdY2VWacC0wKT5gMBsFp3RJV8KXRLvYApiG7s1HPvi8U+uDrehAuzvC3
         /I5nnmP1aDuuMI69K61hqKNon8Qf4ekV734jRu70d9eQPPNzvFQpBGefZd7RjgqCphcY
         +c1tQbp1l5+wS8TouYZO4IY05bjBoAJw6rI/elR2Gdku5J3OucF5AnuKpV5wTzbNQ4Bb
         bDWBjLoxMwaFMY8VMy0LyX51+kQmz83O68QccrWWYpIqnjvebq2J4FWYuzFAXwBNi2ZW
         2PFK5yqmGnG/OjcVuSoZ040yR45SN5DnTmi7fgCzHxnuNPOuc+j0j+IzOg3qu4vGUoqp
         1wzQ==
X-Gm-Message-State: AOJu0YxE+/xvhlVoF6RAuITIwjGTCNa9MQto/fM/+1RqoUpHc3kfJVqT
	uUQawISf4hEO+G7gkHhJq9FIzxAqS3Hn4tv87nHmXjWSwzIQkp271CIingOy0Nd1n0Lezxy5kFb
	j8oidOWOWTrvNtrT+vvLGixLcyEhD4LyyAZ3PArPFJrK7zT9WBgUjioyZTViy1mTr
X-Gm-Gg: AeBDietqiXIDphbdWYG9e5+35Pyv+0xj2mlcvO+KshIqL4tdTIv4sj6jJF/jWjqNehw
	8lVBJcp7DCdB7i3fAt3MbajUc2e1O1Wgdu8Y8Hr+b+LZLdClWLluEqTobHfoHgf2tnU+oCWghsM
	uVeBwiAcIPL9T6USrwouHmn6W0bKJlu2WhirZp0J6okqYVSf40uV2oPs5DN9j6vl6m6ELgvH0uP
	1Aa0164tHez0EU9SjA/qX658PcM8K4MhIKSy1ibn7a+s/zTJc8RKDYtxAOAEJcj6xg2DgBlQght
	LhVvheCxEviL5xpeHMPViRvR3CVVlo1mGycKx+OZ+bgapLcReCiVpNIqdIsNQEBxM7Up8DtdQZH
	M4U4FVY3tNilK+RSowEXsOc3HJkle7bjh9DAXGmz5iA98drIiO3a7edtyaQAh1W+Rip7qIznIcZ
	EA36ZMK6695ro=
X-Received: by 2002:a05:7022:6628:b0:12d:e539:98e0 with SMTP id a92af1059eb24-12dfd846ea8mr4341840c88.39.1777904474346;
        Mon, 04 May 2026 07:21:14 -0700 (PDT)
X-Received: by 2002:a05:7022:6628:b0:12d:e539:98e0 with SMTP id a92af1059eb24-12dfd846ea8mr4341821c88.39.1777904473731;
        Mon, 04 May 2026 07:21:13 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8452edesm16546186c88.14.2026.05.04.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:21:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260422163258.3013872-1-nico.escande@gmail.com>
References: <20260422163258.3013872-1-nico.escande@gmail.com>
Subject: Re: [PATCH ath] wifi: ath12k: fix leak in some ath12k_wmi_xxx()
 functions
Message-Id: <177790447285.1253723.863841301570135163.b4-ty@oss.qualcomm.com>
Date: Mon, 04 May 2026 07:21:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0OSBTYWx0ZWRfXwxxAdz5IsQkS
 iA32vdbLZMWjpB/mZX0intHkcakuhB04Pepf7h+lB2nCxzOXyRH9H/tI8+GJIHmyHyfIMvFRaRz
 RAMgnGnxc3JtG8aMYmAlVdS6Fm45Iu1sIfuC2TZrDHEgQMSzhMFA+aPP096ssKjbod+skIk7tcj
 etHX+hP8yv3qqkp245jN5EGjp+rWQ8pdBGi8p8F3g5gtoSilP/J5pt9khHeoln07j5swRmr7Y+b
 ARDdeV6oZUc6z6NE184Y0qFRxLobwOt2EtuEADoziIU8P12VKqfTRRZOMEWO/azleVwneX6Czpz
 Wpq7DxxJAHb+jWwHkI1QqgQzi/qFmJzz4oJeB4AWc14RBqFwbn1CDHosyd8t2rVIGzgekHzS9Sr
 iG029W0WGqC4rHG+BTsQji9PMTOwvVG3V9R5cCcvD6SpC3RNbwBglWQFVa3zijUrEK6ZXkJZcUq
 linedpdU4lz18bkofsA==
X-Proofpoint-GUID: vxwwJY_R8aTSqAuAUJlq96uZwP1gJu7w
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f8ab5b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tJU9ox1lp4qBWCJDgPMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: vxwwJY_R8aTSqAuAUJlq96uZwP1gJu7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_072118_477173_59B07D8E 
X-CRM114-Status: UNSURE (   8.23  )
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


On Wed, 22 Apr 2026 18:32:58 +0200, Nicolas Escande wrote:
> Some wmi functions were using plain 'return ath12k_wmi_cmd_send(...)'
> without explicitly handling the error code. This leads to leaking the skb
> in case of error.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix leak in some ath12k_wmi_xxx() functions
      commit: 05c5078de822148e7cb84968a8783ddfcb6c9ef1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


