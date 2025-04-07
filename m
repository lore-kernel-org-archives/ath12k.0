Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788D5C369A2
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPVafLpZ1KQwgoYIl+VYcy6p2KP5KKeKiX8x9rBQclE=; b=KQEw8HxGuXxlHPmEn3awN4DPbp
	4j66wWcsGAPLcyzAeduBoFy5+zaYHUrRd4+zIdS6Byk68VftZH9suDn6MTj+npS3XwW0o/rYpFkuk
	pCtXLkh3hP0RB0hSUDo1PQqfMHxWAScMnjode05aKVg5ECqJpMIiO7F8VHRZ+w7CEkNY6UCyillpL
	KmsL9bM0Oa3knnTG0rSkwgkHysFqQSWYkofT4o+noHxoSqhIkNwnU+kQjbBIc0s/yfyWk9knhqqh0
	VSQlo/micEirS1tYcKhVZDpwTV5yAbpWcm+gHbaTEWzHMTb/vdKf9miTJ0Ea10CyqJTf9vX/JqVPK
	zSLmMAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pAF-000000018Fi-12NY
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 16:17:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oKM-00000000wZp-3M9J
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 15:24:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378e3Vs017727
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 15:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPVafLpZ1KQwgoYIl+VYcy6p2KP5KKeKiX8x9rBQclE=; b=WFkpJAXc16TXRxzc
	tMqgWDVFYngGdOTnMUc69HMgccQIWpdx/tT4tCWI+nrz5Kgdau2MRt8MtMzNwOju
	POuYB+Ao4HhlafN8QS5b+Yex66wzDbB1meF+KndOhmrm+XMUF4JI45lIKQy9hCuG
	lgOrFJQ/KWH9h/vees4TpL8xjTS+nDmEDEWJSOCYXDBaXbk+IJuwkzJoGf0p1mrm
	IH/p03IJpSv7gl7Kb/+PfDOwFYO/V2KUgKFII7nPXlTf6Gm7/bh3R74gwSY1/1xJ
	3xDVUY5DzhNQjgmV3LLAaHMBvBhLYlqmW9NrKVpf1565Su0/PLd/d++uz4N1iyZ7
	UvCOfw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3cmxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 15:23:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224347aef79so64200165ad.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 08:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039435; x=1744644235;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPVafLpZ1KQwgoYIl+VYcy6p2KP5KKeKiX8x9rBQclE=;
        b=pqsO852SQTyxFh/lWHQ7+J05YJ30fOH/XO2LxZGTt5awZ4xy8wtJmc0FuE0071tfH9
         USZOQFq2JWUOqxXZRJ867Wt2DtR6SXTPCV7etk4VK1EvvKW1g4viNllKBR1YcuO5F12Y
         xYTXPjxs+WpzzShAFtpMgo9smqvkFqDCgcwNtVyPKmu0F8gW/0XfRdx17UYqfsUbqn6P
         TtEZWMMkcJDZC7dTuf+6hva3LGmZAXW01YuXMTOFjWKEZZaAcyOaXyGjfUKIZxGdBI3P
         DWhGy0nywtjhLLGOhmwh9T4gC8UAVYxev9pvz5rLKNsrAgd82MgF3l/erbRifvf+ZigJ
         9iew==
X-Gm-Message-State: AOJu0YyTU5bidr0BMJrghjIzUulRPxXGxkDbk3jvF7ORqbxWKZoSZsWR
	WxqEF7ZmhBzzmwOoRlk/ONXNRcjijh6CTT/Tf6MntPHaL08l/5v/JleYbCA6Siiaz/QHY5jijsI
	mliYEB8E6bsGMzMaWkSs6DzGfVuTjCuxsqnul1aG+0dxupPVeN+KDklC78y38/5yCZKoL
X-Gm-Gg: ASbGncv49wnnJSqxUMoXYW/+NX5UV/MwNT8iTxsDA6VgTTQ+d+viX8USyjpv50XG6cv
	gr7mXkbmAzOHcDyzfhwriYrIVjH2Zr8mrxglVC+0lV3ySv6GRXN93pZolm/W2fN3ZaRseQ7cng1
	GXA5CU7CT9vfaTsbddxz2mSerZz3ycPfqGLNow5Te6Icj2Yc/78BtsVFvNMOUBSkZpyn6SfV1ZK
	5ftv392iDX5OStqmp/ryVkVbFhgfOrEy0B1ZkvKOnH/Q91kKaHe/EDyiOpZzB8RULjf0x04sdj9
	DR6Qpw5q35w3BwEhegAEOFZJm68PYP5f2IbFg7i45aMXanjTnS0o
X-Received: by 2002:a17:903:189:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-22a95512156mr107876715ad.19.1744039434898;
        Mon, 07 Apr 2025 08:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrKm9eJ1wzqoqedel9CT8njg02rwA97wtuHxpiSBWptxfyZZkrwCEllOIfvQrrAozu/W3cMw==
X-Received: by 2002:a17:903:189:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-22a95512156mr107876405ad.19.1744039434468;
        Mon, 07 Apr 2025 08:23:54 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7d3fsm8691592b3a.180.2025.04.07.08.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:23:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <20250320112426.1956961-1-quic_rdevanat@quicinc.com>
References: <20250320112426.1956961-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: Fix incorrect rates sent to
 firmware
Message-Id: <174403943378.2068408.13497064533641126291.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 08:23:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: OiaLJeEWXCee6ZSYteFQY38OgCGebaK2
X-Proofpoint-ORIG-GUID: OiaLJeEWXCee6ZSYteFQY38OgCGebaK2
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3ee0c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=YRjURhDjmDyyyRhygVUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=866 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_082358_962406_61EB2351 
X-CRM114-Status: GOOD (  11.10  )
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


On Thu, 20 Mar 2025 16:54:26 +0530, Roopni Devanathan wrote:
> Before firmware assert, if there is a station interface in the device
> which is not associated with an AP, the basic rates are set to zero.
> Following this, during firmware recovery, when basic rates are zero,
> ath12k driver is sending invalid rate codes, which are negative values,
> to firmware. This results in firmware assert.
> 
> Fix this by checking if rate codes are valid, before sending them
> to the firmware.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix incorrect rates sent to firmware
      commit: cb1790249361ba9396b06b1af2500147e6e42e5e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


