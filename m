Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF00C83F36
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0uOv3IPmfU+7O9dZzGnl8dA25eiSk1URc2ZFMz6+6g=; b=HYj0mVCr3ogIwONsG1dkbY5m8l
	cTZbu8sLyfY2o0KP/kbf/3CBBbdBLE3o7zY0jHOLiwrCR0mA/GbIPD7CshpO1mItmuOVaUeWIdLHI
	N0/zhox8QfLzZS8+i7oB9K9DEnIjv68pdtbNoKtOz3UDNNE8jfbPMvAXHH3Mq9Mr7msaHyaV+5gMT
	DlK+A6lBaVSqaAZ4LQVR28KzFVrKVeD6/Da1/1zZyTOkjX03XdnKgxmlwCTiNLHXEzaNTmA4s0LCy
	1r2lHYTgVQErbz6mvaAJHiP7CxLbCSjK0fIg1WMRGa6wDNdyuTDUBUpSB2fnEjkqoBb3EA/5omRQJ
	vDNtRBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBU-000000061Rc-04Vq;
	Tue, 15 Jul 2025 19:19:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiRr-00000005jtc-2eWH
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 16:24:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDHop007378
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 16:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0uOv3IPmfU+7O9dZzGnl8dA25eiSk1URc2ZFMz6+6g=; b=chQQ3B37Kh3aCBhq
	X47SthyUloDWUl1KzC6m0Fnm4vr9JrpaE4BJEpRRGm4u8nZS6dZ+wVdGoNe4F65q
	XvlGtKlVQrxBE5vLn8LM0mbZSz0r/cPjKjTTr55ajSOYWiV9Z4tc+oIRmSO4c9It
	FDSfUrcay8FeMwtKBbzvjnCZ+9V4o2jYRAX9O0tir0cfdEpRssu2wqqcW+3ILikf
	IqV600P0cC8ecCxWsUr1UbJ/UevHgoo30T7lpRwBw8jvl6u7ItfS4mTEG9QEY5LL
	NAH/g9MsgM8Nxv1xMlVeiXxIu8alhxjYFvp8Ml/pSw4WCGkH5NiObCiueAqfqJAH
	kc0Lqg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5s3h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 16:24:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7489ac848f3so8461571b3a.1
        for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 09:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752596645; x=1753201445;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0uOv3IPmfU+7O9dZzGnl8dA25eiSk1URc2ZFMz6+6g=;
        b=vyOZAN0+wisyEXPMroS3hbDN1A7J0Zyx/cBY68/NrTfUi1V1i1Jj6R5MHuvYu6U+q7
         1tOqCI17ySCOEoDCqRzVTEhdBZFlySmu2KMYuZgjAnDL7hUwjXHy+qKkwRXIUrTrrpCP
         Dn6qcGXqVxrpnHlBTMy2nGuCFGvIWWxtK5aCZR/GY9vsfwULiw+CaTxG7XrBQ/dG/toS
         DSDpI38XM090WGjz4U6sksq76nMp9UCS8sgkfPYvanXvYlcwcLuSu8S0jTPGuUUEWDmR
         ZoXahlKXwCqvtAcpP+hh54ZFA/P8YMmyLFCDCef9bFeScAYRDsrdPmZVjcFiZuoByWOL
         vGXg==
X-Gm-Message-State: AOJu0Yxh2pWR1FQtEgGmqIJkssytkySRaNaZ0Y1bD2nCY/kEapucxHU4
	0l2WG0MP5VQLTmijqTIpR/c3hbZyIBmeFp466zwaY7KepEpFAMVt4Q2IWIAmnZ8xEg6uE6Ray81
	8XDV6twWlOQ9zEOrCleYdrdpwYefo8UohVQ77EhE0d6qjSy9Q6HLvmzJ+iDa8LL2N/qPiG+17
X-Gm-Gg: ASbGncsxoWt9pA6zSq32AKNBPFX4uaSCfxm/sdoKbKlVVAESrc2Q4OiUIxuUfUnOZgb
	RHQwr0wZ1XP41Wpugzx20QU9FbZmRvP5Jz30M9sWudJa26v5gd+ApupV+QPvJ/0/b0UcrwDn6eu
	C3xQZjsbyqxPhYa/7f96E0sOS4MF8rMfQuFWY8q0RPtecdS1uNw3cpLAfgWe7EcuSHHv+y+NWE3
	yTdOrN282Cus7H4bIp0VBCC3IK9/oxaBsgQxbwQEY4x63u6z0XC9NPiY35MK0zSAse4osDdTluZ
	9J/gvbBtZxo2j58Twh6Df/nluUUYvZfWbzdp37PIB3X9xVbtJq6nKIvovZncWoKc4NK9P2mDg5j
	v
X-Received: by 2002:a05:6a21:6da4:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23137e8e69bmr32380745637.22.1752596645047;
        Tue, 15 Jul 2025 09:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1197CjHD6W1MxKFmcbdIwLpLagBGJGF+LUg6mOqLqRXQY54/ZENvNcpJfhoz5D7J2N5TJEQ==
X-Received: by 2002:a05:6a21:6da4:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23137e8e69bmr32380704637.22.1752596644588;
        Tue, 15 Jul 2025 09:24:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b715sm12815373b3a.93.2025.07.15.09.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:24:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250711035420.1509029-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250711035420.1509029-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Use HTT_TCL_METADATA_VER_V1 in
 FTM mode
Message-Id: <175259664363.3448282.4931008449514429763.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 09:24:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687680a6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5bc-JWag2cNjQzrUM98A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: srWllbbz9AyCZfj12s7LUgRDpMY-wibI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE1MCBTYWx0ZWRfX9pRu6dA5iP95
 m9fJCdvB4qfK+uFS/yL2Kk/Q0F7xlz5EY5qhPGsZGFxVzvtxLiaCFzoFsra5JNRSRE/iUVu3+l1
 sLi8FmuKCFgEpOGrF5ZtxQBqgJOZzZrL1JWeNb4WvuiVcANNnRkG/PxdLSPmHscO/ToYW+sP5rU
 Ig1PFXIrK41JxdFS+UqEfF15K5FbkgmIxSupXitUYLzMAMLhQ/1/dXlQbTQB4nA1Nk659wfH/sj
 BLgQoh44Vg0a0uDX0Xt1zjBSFeuYpdwJZa78tuQ0fRBQ/81ZlOrxT/xDU7HBI5MtEp0pQJ7BH7s
 ZpUQ/MPRmRjCS/bHnFI6WM1W0FwHji2WvpUay4wY2+6iyQ0T6qxHklMEJFAS1Of0cl1A1otAj5l
 cp+P5NGKjq9qRX0GlMBtDsPSNTg/lEeTnZP2+2YuwsrIG4mB36bnJ0SWBFO59LbmvOiuu07B
X-Proofpoint-ORIG-GUID: srWllbbz9AyCZfj12s7LUgRDpMY-wibI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=850 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_092407_677212_6B80B1E9 
X-CRM114-Status: GOOD (  10.81  )
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


On Fri, 11 Jul 2025 09:24:20 +0530, Aaradhana Sahu wrote:
> Currently host sends HTT_TCL_METADATA_VER_V2 to the firmware
> regardless of the operating mode (Mission or FTM).
> 
> Firmware expects additional software information (like peer ID, vdev
> ID, and link ID) in Tx packets when HTT_TCL_METADATA_VER_V2 is set.
> However, in FTM (Factory Test Mode) mode, no vdev is created on the
> host side (this is expected). As a result, the firmware fails to find
> the expected vdev during packet processing and ends up dropping
> packets.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Use HTT_TCL_METADATA_VER_V1 in FTM mode
      commit: 66b3ebc77d23d6574a965bdbfe41de8aeb7f384e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


