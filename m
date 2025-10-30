Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C080ECCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbxlqnkWJKv72MnwB+3LG1JlDumthqKLFTiHBb/B/wc=; b=Ai4o2yDDtgNS26lU2QVp1HA5Gl
	vRT1+MagfdpLaIeYtVab8FUtOXVUTuk123syQyZMMH9hemSggWYTbVseYvmEaW0dz0xjoIuIENIKe
	QQclTUP2J4bBV73iQFGO9CdWUPdPUuwnmrr5QV/K3GpFuHvh6sgsG0sdh/xxsLqlK9y5tz0BsmJzQ
	RICiqfgqFwZTWMidePCDQSu98ZrSHn51BchiI+qcR7No+kYEtXFAbXJnx8ij42mx8U+Y1qp+5++YS
	5gRllOiBzlqRKtdYTYflN4MxHWzklA/H6wLIaUgzvVJET0Qp8EaIy2Jr0hyY/a66cAIhLiPbpQE9H
	DLTZy0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeV-00000004zqH-2EZc;
	Thu, 30 Oct 2025 21:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeU-00000004zpG-0B9W
	for ath12k@bombadil.infradead.org;
	Thu, 30 Oct 2025 21:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hbxlqnkWJKv72MnwB+3LG1JlDumthqKLFTiHBb/B/wc=; b=XTNH78+hxDlq1Y5eGVZCuH+Q3d
	l0neYMUEo3/PHBhG6AxzytSAUE3Z3QRZ5YGwnj7NJ4VOr8Wdz2sSqocFZ7DKDQNySaYaScjAxLMvp
	wOYn/GP/ovWIzJPBNlgLT5J3WTU+S2+za4Kw09p+ff0jMM3txY8n/Mf6E3Il97ZOYHG3GEFmXk8og
	o+cVhT/BiIutDB++vF8jzKYgepq052h8oivFRXrw/3zNIS3f309DG/f48HKg18Q4fWWUo1hICq9Oq
	LamHDvi3tx1vvP56jdN71MwqqOxR/DmYHwz9sbkWp7QB/NJ7Cd22cPE4ExC66QQpRFsY+vNoKeUa2
	a8d7+tfw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZmh-0000000A5JW-23cy
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 21:02:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKsMgG832740
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbxlqnkWJKv72MnwB+3LG1JlDumthqKLFTiHBb/B/wc=; b=igCpRbFiLpUf0N/w
	Icz0TjWojhTRRO09YZ4ZKZy5sY1Y7fS/WxzVKImdxQW0DL6oUvgTx3btchE+sfTR
	vSp46K9xoDy5AEhsvgwgWmNn0nfTHplgbWXLmqPtSiBpL0f+yUIq5vNJ5x8OgeLW
	nhkBBizuOxkeftSp4aZYS8nBdLC2+kNRxU57r+KCvP9nwCWDRHf55FwIc1yhHq3q
	2wCbggK5oABqN6/p49jKODc943k9lSliNAh4ALQTRhRZpET3ziDK/IDEw24Z46MM
	SQmNRmv2y4oWgHhO2mEshkL0n5sjI12OO/PKW5J+mRTCgtPZPHXOBVOlHflMh/xn
	/NgPLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb04uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso21181205ad.0
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861460; x=1762466260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbxlqnkWJKv72MnwB+3LG1JlDumthqKLFTiHBb/B/wc=;
        b=eK9Ky5X1yHx2JeK9Y0X4VltILTbIKuR/CVwMoGT43UBdXfquM6jJ8JUF5YuAlVNp2s
         hcYTk7p44cFWkADq6DRsiRX4EXGOA0VmWcq3v+c4HgrKbJBJYKP9ZPe+6rg010kT4NtP
         v0LtzNNylwzCz7RnK19Z+GJaAMVfiiNFY+4WxFNpvPII5GpsRmHcIf182HrrfI449R/4
         Acf9r662bJlpN2+/40Yu3OZ0oCigrU0SrORcq/7g/wj3NQV6OqajlnS22jhkT/AArkdr
         JeKRwhAjjYhzQHHNaTcsO7qVn4OqnccZ73lMT/pkXRDeqPbxaHsgIB70jK+C8I1ZbGA2
         qQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861460; x=1762466260;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbxlqnkWJKv72MnwB+3LG1JlDumthqKLFTiHBb/B/wc=;
        b=M5k+ZfyZFUauIkz7f/yq1aOUPW4ulF4GnpaB9Jv97dMuY1d7r6QQA8Mgg4agf/mXTd
         EAW1wBtpm2m180mzFLwQwaKU2wbnjMWaJV6nKN6KHf5oliF2WZx1ouT+Bjej2DygopGk
         PwG837xrXO7rQlRxM6ZKragaXwyEqcyTvlo00YpkDJtNOAos4qTSaOlDW3GpO7Jqglks
         XjVQpF20iyE8EvT3+kwqg5z8OyOLfafxLRHdnEFPfJ6ffsXdfPs8UhFmOEMMQjlOjDPz
         Wu20WFXgfZg9sCiw201oX84sIXbvgHLZHCLIN1sQjBgGjWPI3+WtKdiUi7rqBuXkNVUF
         +E7g==
X-Forwarded-Encrypted: i=1; AJvYcCWpnRJsR8X/rzTKWJDN4AIVafyDCf1Edbpx6gi9Mp3oCcfEIJAbQ1ZNSI8vIm7Nilb5VIcmHxw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYiGWYtnKaK5dK/d8PAM/RN1TAvslrGW5IWHjvwf9aKyPgekpV
	Dmj7kCyFjfDBKjW0MQs49N0W70F/pZcHGfW0wGQYimfuTfafyDuAegu2P2kYtK+JBA2mQHFTc5I
	SSE4/bnkzBf3wG+Vc3T0l2W7/N9V/uKMjbs5NmmK+8JqX2axjUz8dBskJHHJ13R84VI5mbu5t
X-Gm-Gg: ASbGnct29qYfIQTb3RPx+AFwwhY1cXv6qN/Fpa3j9jBDcAzZSM4uv552JF8cvD7N9mK
	iJWIzz4+5nOPpykNArdrwdhxiemtD96KGN7zloIjyONB7LUT7O1v2+JlEytwZCVzn1zfUipeN1A
	d8+GUjXMtjK9v6pWjb/amClAl4+9HiI5JD+/hHRtqvgc+ZaMxBQnA1NnGq7AuiswNQl/gLIFO2O
	vxYEfV/j/PhCh3N2hnxbtR20LYEnYRRJvmojpsAfVxieUm8BoOB3mTp5VoVM2KP1ptg1WpSpX5h
	w6nsSxXBmdRcd+muQZvETGade7iNrLZ7O0JcaB/TY2SC9JbccbgVCRuikWpaQORYEMJipiYCCOe
	MFUE1SDVt76UW3trFeXZ2/Dh3vcaM3F07Uho=
X-Received: by 2002:a17:903:38c5:b0:269:d978:7ec0 with SMTP id d9443c01a7336-2951a45a15emr18108295ad.28.1761861460574;
        Thu, 30 Oct 2025 14:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxZJ3rUOeLoZ5JdbU31KxAXQDa+g3r+fwNG5gM0aI6wgEv2sSZ9CXBSV2RLCpCXzMfrc1egw==
X-Received: by 2002:a17:903:38c5:b0:269:d978:7ec0 with SMTP id d9443c01a7336-2951a45a15emr18107955ad.28.1761861460134;
        Thu, 30 Oct 2025 14:57:40 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm201868405ad.6.2025.10.30.14.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:57:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251028170457.134608-1-nihaal@cse.iitm.ac.in>
References: <20251028170457.134608-1-nihaal@cse.iitm.ac.in>
Subject: Re: [PATCH] wifi: ath12k: fix potential memory leak in
 ath12k_wow_arp_ns_offload()
Message-Id: <176186145939.3489476.17111380584676068402.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:57:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Xj_wwfTKdOcDAcBQ8r4utBs7wWMtrs_u
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6903df55 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Xj_wwfTKdOcDAcBQ8r4utBs7wWMtrs_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfX7zm84HBKVxZV
 /jOSHcT/8mXBEvXYcz806km65ZcJBDjsxJ5SCpXeoMgCRZrL9w5y+if0hj1UtwmMpz9HXeL0dr8
 Y6Rw+A6htT1a4FowkBu68PyZZlcyxuaR60WAXChnXJp9F0SfhAC66jU3COtf55AYtcOfj8vPRTT
 oTeQopXIBewUW2PVibKatqC0ogkiaWEB0AHCeoHdUo7kC8bnLqkVL/TJPVRZoYGiVrO8fuGoqmd
 0Yb24zGu4YRY4y7G6KBWZh+PyiksHLuliOiTHHg/O2dqP9M3EB4g1zBWbT+WqdCrNa3PHv8ordC
 PzLauEkgCIRwYzOcnDynkf3uJXMTJBpf9os4IQcmBEOx2V4PfAHrtDgso8XgUft7ETT6/H+rY6r
 R1P+ZTrK+jXAebcuId50FV/Z6kSZWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210216_275352_7A9063B9 
X-CRM114-Status: UNSURE (   8.20  )
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


On Tue, 28 Oct 2025 22:34:55 +0530, Abdun Nihaal wrote:
> When the call to ath12k_wmi_arp_ns_offload() fails, the temporary memory
> allocation for offload is not freed before returning. Fix that by
> freeing offload in the error path.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()
      commit: be5febd51c478bc8e24ad3480435f2754a403b14

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


