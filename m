Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4076C83F23
	for <ath12k@archiver.kernel.org>; Thu, 10 Jul 2025 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO9/J2g6MEXYXBGRQgoDLyZy3d95jgA0xWAndv6yaRc=; b=bHP2zpNjWyicvfuUTxJNI5EZfB
	UiQHN5Gx40GjwkP6v/MYD9wFD4IJwlrGnns6tbPNRPjTv6CgSMwHKCWoGNvN7FhUPAs4k87IhHhWX
	7wWtz+IGkKyY2wAno7JWHlIsCZP7T31yhYfLBtpIg8BoOFeDubbnpdG23/b+tfMSh9tldgRGZaOCF
	ZhJfAUgWnTCDTBafR3TNnJb7oV+UZ2Xk3MJgtYj5XcrhjeDRa9r1H/jaIFEJ6omtPhTXGtYWNNYYx
	25/H33CUptrRlM5XJZkqcN0mwbx4lEXW9OGtKKE0pu/XPXIAtl7EgwDn8gQbcKk2l+dr4ftWGpm0f
	nYtgr3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv55-0000000CaKh-36T6;
	Thu, 10 Jul 2025 17:29:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsNm-0000000C8Of-2gKE
	for ath12k@lists.infradead.org;
	Thu, 10 Jul 2025 14:36:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9MJXB002667
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO9/J2g6MEXYXBGRQgoDLyZy3d95jgA0xWAndv6yaRc=; b=GWhUMruBiDabRrcV
	4vNvWAzfTjX1Vod/RSFK/rX+bFIFbMaW8KwC7nvr4pXyydJVP/0zTYs4n3Qz7lV0
	5t8Q4pWOjHCU1X9+lfBYY5hEgA2exH7XQ50tvWk/4NGJP7mr0svYhDFO6ZulfJKK
	wm/qjvyy0+03qCz8qGO2uoQ4F3LAU5QlaKtIUgkdyEQ3BhPIkJK/3HU9uGCR7W7c
	acb8Uzb8HSW1tmJ1liBBRXR65TViTSdxPZRvCRPtuG0MeAgxQNlaibzGkaA2d8YA
	oH0z4VRuj1EgzfwrcrE/m42YltI78V1bPzvoKhk6vVg99BZCr6l2p70NoXwL6FaB
	nrok+Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bgjbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b39280167fdso965328a12.0
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 07:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158176; x=1752762976;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO9/J2g6MEXYXBGRQgoDLyZy3d95jgA0xWAndv6yaRc=;
        b=vqf/WjGmg+R6ym9zKFU6oyAqXxu2DFSfcjkeCj0ECe1TaAVcUieSeJ1f4JFnDEYfiW
         GIPxRDEBwWPQsTfqbL1s3rzKLu7awwVNVrKt3g1zQBLu/I2EPwjUhfmB3MpKQUXxFZcC
         m5vUZ4qReRkt3+QmjfvsFGL0YqFGVjRSFBfvyZ8ZmI/HuoFEHTL0yukbkqfU6stcHsgT
         JDiNaAyupGxY7MQ+BeR3UxcHeQty0PB2s3ddbMguewpCnw04oJLuCPOYBc464yH1G4Up
         egsWSJvR7zCE5XRAf0yNj428DJ27KfSBITD0MEo5j+B14xbB9ArLzY372kg7jGPx9Hs8
         D9/w==
X-Gm-Message-State: AOJu0Yy6X9lz5xEQ2W6W2mTBWDA9TVZXavj0fTJrnZLHtTqIOeLbYv2W
	BhrV3y1XC/1HRdMJxK4+eYPnbbKYJAIZiRZIDz50vt7JhUnReHl2bS4FVKudKrb5KDYi1yOhy5X
	999stPvtyn0vuMgUA3BFoS0GCKYXhkKCurwpoZ8aac9zL0eHuo8siR/OWU9VDB4511wUJtKFg
X-Gm-Gg: ASbGncuE+yR04zOxkKQ/CfiGZdv0ziOZRppKhm6KMBzXK6KLRxJxa38jLlHUqrOCvK5
	ivvskMEtm9AS6eIMtbmHZBzL/h/8utIAKHIABg+Z3JixHyrwM7C1wq7M8XbruEKRiuao8l+vWXL
	1lPS4tvb20wQ/Bzh9/q0b4QAK3YWmrPQoltaScWuoHP0R2796+A7pYdJhDjUWwMCoU9slMCAoyt
	tWG7Eot9Gt8XzqT07qwLPVcW2PlxK+yDguaVX1N7jq19k6dNkJFu0UNvOp0paXZ+Oi5TTT/PuwB
	//3y7uY3IspcA1dDREVOiHsVDNJfdRMHvblzVTou3vY+8StFHGpzc/D08kE=
X-Received: by 2002:a17:903:2f8b:b0:234:a139:1210 with SMTP id d9443c01a7336-23ddb324c2bmr103419345ad.53.1752158176156;
        Thu, 10 Jul 2025 07:36:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Zokh1fcL5c3QnWz/baL6/aPcJgSi60yGHw9IN+krJB3T51qEgd3aFnlsdF9pQ7bhT65Zxw==
X-Received: by 2002:a17:903:2f8b:b0:234:a139:1210 with SMTP id d9443c01a7336-23ddb324c2bmr103418695ad.53.1752158175401;
        Thu, 10 Jul 2025 07:36:15 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359a86sm23758055ad.210.2025.07.10.07.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:36:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250604101620.2948103-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20250604101620.2948103-1-karthikeyan.kathirvel@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: allow beacon protection keys
 to be installed in hardware
Message-Id: <175215817445.507672.4103011704261170558.b4-ty@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 07:36:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEyNCBTYWx0ZWRfX7yO3GbPNZ38U
 a63i9/QF8ua65p/QgjymvHognCgWDUWPngWLzh8LSEBD9pNo0642kq7526HnCIccCJ3VCJBJcn/
 i8wD3veMlamXEyHStcNwTFfs+Hwsnr/yj3cLk7ZLo1JvAIvkwm/F3F5RC0ZYyib/VUyLmHNx2xX
 RIAUXD9rz8488s1NGMBxENLLDcuL6o739eOhKLkk0jx9t0CB6oC6nE+MKIsSjq/B7nVNet+BbII
 BTSpPYrVDHArQhVnIu8Zaq7XU+rkjqZnkYtXhQxNvFQfWq4TYvj2jypCan62C4oqXhdMaovwHJl
 kajSTgUXAFFBu0zusqgmSBVpyNRibQlCTMMm74ex7BtMBkr/ULEeQ6DZv4xnphd15o6z2MfTapC
 rJBtlqrAPXGNP4ehitmMET17u2HpSLJPlhlMP9bknX2niiFH/XmbL8EsjCrGRxobdZG90B6C
X-Proofpoint-ORIG-GUID: Ne7RZyHHvGejhpXOBZWhpsPIbWlYtO2H
X-Proofpoint-GUID: Ne7RZyHHvGejhpXOBZWhpsPIbWlYtO2H
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fcfe1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jPXFS5PPpB_IzyrbQoAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=958 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_073618_796900_C2510998 
X-CRM114-Status: GOOD (  11.04  )
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


On Wed, 04 Jun 2025 15:46:20 +0530, Karthikeyan Kathirvel wrote:
> Install beacon protection keys in hardware for AP modes only if hardware
> supports it, as indicated by the WMI service bit
> WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
> beacon protection uses keyidx 6 and 7.
> 
> Control this feature by setting bit 0 of feature_enable_bitmap when sending
> the WMI_BCN_TMPL_CMDID command to firmware.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: allow beacon protection keys to be installed in hardware
      commit: 27ba973caaf85ff3a2a23eca33d6dc9b4fe405e8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


