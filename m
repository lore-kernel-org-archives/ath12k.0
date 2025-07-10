Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BCFC83F17
	for <ath12k@archiver.kernel.org>; Thu, 10 Jul 2025 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQPEiqqj9VNrqfrfVuyEmtc95c2M+h0HYsN2qZTWmag=; b=VHOZS6xhbktOhEIaylu73mLNlo
	K+UW7GJCQCeF5vRVf5NLnYvaSgVDVuN2MbKJO/RlJKQIWh0z4ox8ujxdQZj/IRpXcPXflIMH+HdSo
	o4VRSz6+7Nm2ZxhmwV//hUENFuSmmcO3DspNBLkt2Bf5LJBfgBOOvFaEn9hF6QZukKXYiKgsJ60mE
	LYgF6/1jepdSk3x3lrcjkiXydOxsPiNVxej+8coK3PtL6gPywvKDh+TppV68XVI/05U7jtpl8jglN
	tt3mz2hH65vNoc/1coCFchRC5gUrCSvoEkhimj9MfBJjc8bBIUqtUxg+Mmriu2Ay828y/7RKD2zMZ
	+vCIA0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv54-0000000CaJI-1NrM;
	Thu, 10 Jul 2025 17:29:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsNj-0000000C8N6-3c24
	for ath12k@lists.infradead.org;
	Thu, 10 Jul 2025 14:36:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9GpRk011319
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQPEiqqj9VNrqfrfVuyEmtc95c2M+h0HYsN2qZTWmag=; b=TYZOghw+bCGWyyPK
	DGYoZ6mTXzgdIPkyiXuvmoTiTGu2r0BiNYVxOJVu1v2ndLjA3bLxqAZgiEygXNd/
	v/SPqcHBgT1gpvaZYEL8cOin70r/A/VwxG/qrVgIr8vtkE1ZHeUYWgn3dLuD2hpv
	p66v5hntCORVXSMkt2EVUBCezcbWmKueCfWjpERQqSyD/SjdjZwmET7c/m84PT5g
	TIXBDv5NTEOGFV8y4pTYaOTTcq5LUk1nPLMmO8cCLzP6ZUqsM2VBXuHzDJixJLUp
	kA7t6Y6TpfrNcX1bvvdhJxiflBpEBCO03EqLOZb+BRVzy+wSJ8lV/D9B4+zYEoN/
	PEBzJg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafn7bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b321087b1cdso1299840a12.2
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158172; x=1752762972;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQPEiqqj9VNrqfrfVuyEmtc95c2M+h0HYsN2qZTWmag=;
        b=ZxgRDN9c6ZgytK0f3ZE2U3qMc6REP3k8toDl6ply4rHSgxTbtJ+c+s6qWrPSwuIPG/
         DSh/WMbe2K39t1pduswuIFH9Nnpt4d8WoO2GUMEZZWidO6hRxQGM4mcYCH/6tuZYrfxF
         N/EwdOlFEfxOYG9t0lEZh4rBCEog+D0/HCoJB355I/HKymavy5IMGHsCfDavzFTJXAQx
         dCm+Zkfy0Idu71njldcAfAOA3zZgJ/gN88VguPO8gdeuhoVY180jvRRGrS3aEVpaDyhb
         wpYtfbyJhGGt26/rW2Ss9bVHRiEYApGJKNri/0EsfRNQBZDMBeDyVCUzN7gqsFwIPJjM
         X3EQ==
X-Gm-Message-State: AOJu0Yydm8LUBq/StiRIaQVwCqmaxa3umHLcyujeD/WT+8jHcVmD7Rr4
	7YCdlAR+WocXG1Kfv46+UZKchlqJ/3EUV3XMHNeEGCg3UzUYyROLQfDA6iHqKTfzOPp8VHSRulH
	Xqe9o/KHXZRs2SmiCEhu+Mw2kTAvkh+p9CL1ip/udNy5VSPPm+G+xI3Hpg48CYU/QLpIdJ1Yg
X-Gm-Gg: ASbGncuVDm2nm5OdJGhPWIdbDaw73+vIP4zgUwtfKhQ9q33QY9o4b2HV2w8+tbtj9To
	P2SkXJl2Zxb8d/d1W+h09FBb/fa440QFADWkp1wSGQ9zpEF4qYM7ETcmyPZs8WQXF0fAt4+JzTj
	QVC7HWZn+mSS0Tl/8XR32kEdIoLxJi9S1fQYrCmF/r/YTvXK2VEPYrDs+FMC6qRxaR7xV5S2ajF
	Ol5hCnJIKboC+k+laosLc+tG1GJO7DKwscswnqccZnW/BmsaaXrLNPhrKtmnTvokxb0riKbLycT
	3shtVQ471I6Us+TiZlfHrtbdmVltKF0RMZ6MEyAE76X8cJhkVw+uMGC8ldY=
X-Received: by 2002:a17:902:d2d0:b0:234:eb6:a35d with SMTP id d9443c01a7336-23de4876bcamr46630085ad.27.1752158172109;
        Thu, 10 Jul 2025 07:36:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzornK5IlTs3i157JACc4s1JN/H5icJdwIbS8IrVHCGZjtXeYDPQ64UgKRsxdIio8TQM/HhA==
X-Received: by 2002:a17:902:d2d0:b0:234:eb6:a35d with SMTP id d9443c01a7336-23de4876bcamr46629575ad.27.1752158171554;
        Thu, 10 Jul 2025 07:36:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359a86sm23758055ad.210.2025.07.10.07.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:36:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Amith A <quic_amitajit@quicinc.com>
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <20250701135902.722851-1-quic_amitajit@quicinc.com>
References: <20250701135902.722851-1-quic_amitajit@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: update unsupported bandwidth
 flags in reg rules
Message-Id: <175215817074.507672.3474115457894401966.b4-ty@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 07:36:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686fcfdd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DaUM1vL2nq2eCnbLUcsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 6I8vaH7JGW6AoHS0TQppfoKeXTRasgP2
X-Proofpoint-GUID: 6I8vaH7JGW6AoHS0TQppfoKeXTRasgP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEyNSBTYWx0ZWRfXwToa67blGbfF
 jAhPmwYl61Q3O2vsdj/jM5eNyitn7bhKAn7v8hYxR1mFDXficTcfbnUh/TKaO5LZSW58lzn9HsL
 shIgKVBInX5ZJe1yFmHqrxwDZehNx+aDnW3YMr8LuoFRjRPWm8JR5i7cWPSZ8LKZ/1kGljc0994
 t4cFpe+O5qEU6FMC1amJ5y1CozHUXdoqwvoPSwMF6G0BIjUtOEciT1U+AWQgT8Tu3UBc5vNmsNh
 tnJEIdwol839gjABiDCTg8humSYoN32uVo9xSse3M0SdCOYcb1lLxFKLT0QzrCzdUzgWLvfs4Ml
 VchOKuFXXYEA80CycgE9B/wX2+PbBd0tYdaE82tOaUn6D2rLbl/n9hMwuXIGG3noxkg/DlPD6of
 n8/ZI0QcVHwTFUIlCTnE0SEG+noWZsCyKO/5rh0oPWEgxcnhI1H0MYJ6RlmQXlSBXox3rFCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=821 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_073616_017247_F211A02F 
X-CRM114-Status: GOOD (  11.91  )
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


On Tue, 01 Jul 2025 19:29:02 +0530, Amith A wrote:
> The maximum bandwidth an interface can operate in is defined by the
> configured country. However, currently, it is able to operate in
> bandwidths greater than the allowed bandwidth. For example,
> the Central African Republic (CF) supports a maximum bandwidth of 40 MHz
> in both the 2 GHz and 5 GHz bands, but an interface is still able to
> operate in bandwidths higher than 40 MHz. This issue arises because the
> regulatory rules in the regd are not updated with these restrictions
> received from firmware on the maximum bandwidth.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: update unsupported bandwidth flags in reg rules
      commit: 2109e98503bc1c01c399feac68cc8b7faf6d0a4a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


