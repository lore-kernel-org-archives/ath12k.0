Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2658AC3601A
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3KglQ1aLC+QdVQpNSXDKg3Gam5Qq7kqz6z83UiaQ7M=; b=SRj2lHISGcw7myhKJS7al6Q3k7
	0RXhWfr6bS2jPZzhjVgXU5Ms3r38aCy9uqpSBIzOv3xlLMqSKmAC6pRc16dImFYOrSH/XZ29PKroI
	1e/ouoqjSpQv0iXDNSuDDYjeVbiksB9vk7FetzcfH4d83abJnmlgouCrDUL5JbHBFB232jGqQvLlu
	oABQz9ZOyuHSn0LefXwWtGOIY7yGVjBY8GPq2f58ONvpNM0LHxcsMhZIXrkKw+pOgrpOhKBjL3qOa
	ag8UfrKQKizrQEILeLWtDwngRHCC98ke4ybv6GLTjW7M4QfmAl2VVOT2bSC30UYrWuZJ7GJIcPr1x
	4enO2xuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhH-00000006T4N-3qIj
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:08:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhF-00000006T2z-1MWy
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:08:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532ASwAa014498
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 15:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3KglQ1aLC+QdVQpNSXDKg3Gam5Qq7kqz6z83UiaQ7M=; b=kLfb7yIoGASg8Q+F
	BNQ5y2Svir2Zr0IyOUt4XRssX7QGAy57Gb+B7+3VWO4gRTZtkEcxtbF5iT45MPj2
	hYoTsCvqJEvgphnT6WnJrG15GNfeuzofrDtwlXDY9yMMHZPL2T2yzxyEeygISwDL
	CuNVOWaV2ldOsqpbNy53GR2fhqjSRf3CgAbXKl5tKq+7QdipAb7wFjZcbmGI/9UC
	Jal4KlPF95tcnXpR53gPVOV7sWLnEswtWuXLzFwM5+O8sz7WIqJMVkJhtwF9dmZp
	5rF+kQpjhw96LvJqBiYPsCPM2+s+GijbsbeiwYUeLKDJ49KclK3KoRs5bHAzwtOT
	B8/CPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvkuc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 15:08:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242f3fd213so106711715ad.1
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 08:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606484; x=1744211284;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3KglQ1aLC+QdVQpNSXDKg3Gam5Qq7kqz6z83UiaQ7M=;
        b=L3R5yA657Epuu/l0TT1L6DZhUHOc+yZ8/a2uw+vo8ZQ471lShFDiWHkhPai7CDIO1f
         rwxuI/4joNRt6WaIpSfOBsfgC3Jrw1eyd89PTU0prETkg6Y8aO0CpZxomwuGJz7GRk90
         mKbRJ/g0mMSpNV0ZKn4NBjmbXjeWVQnRDak5kG0WBx+2PSyxMwWsviAYBt/9iNIImBl8
         xO9aE9wfxZch4KgfT9GPXCsVx0TEePl5u+B2ZLfW1Kr0ooRMLJbQyRTLpUeG6KC7ljOO
         0TOZE/4pr4kyftJer0IZQe9VNaA57UGAHw6ktosTOxvAStSF46tArKJa633KDzDInAqy
         uMQw==
X-Gm-Message-State: AOJu0Yx9vt+KZpMC3aptLnulu1qAVw0Nv+vdAeD1jPG5IdnmtMceDcES
	6KpC5cWF/kXP2QfGLgqbHq3AAvUGGg6DJrm5UChyTwa1awM4tpMpuGHJypJxHB28dNCa0ycmI72
	/DH6Cl6JYvEkREkn3L5nFjYKY+Pk50cGjXUMn32vDwgS1pkqPMXC/BWBTe/1X
X-Gm-Gg: ASbGncuE/cHfn9w2vqfdUcDr9X34QxthHCODx60UqMNgl6mR6lFgrsK4DvwwNWV5YXq
	mILgfjzAtfEw0FKuOpY8adRaJREFTb/f3Y0Dy3+2Xz04Jq1MtsvsBSlID3N3OZ7i6zWBL7mlLOg
	l6MhqyeEwAOMtujvC1qJNXmwvw27D9elGpDkxG858YKG1pgegLflVpeEzqM73xxdxZAOfEGg+fu
	WRNZCpB36Ke+C9ipdv14WYTGtRxiySS4trB+DWWbH7mzc6d4N8yWNNvtUYurdfGl82shXE7NUjZ
	XzX5VdxZeG5cGLQZkP9u06yMASzlaquRVjdgBh6M60mwxWPy4yqx
X-Received: by 2002:a17:903:120c:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-2292f948bb7mr278396965ad.11.1743606483269;
        Wed, 02 Apr 2025 08:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTjdD7aVWLh2kVEEVM6LmX8FK1+ZPqAu8gYYTMClO1lUW7ahOqL9yVO9j9tK1semCNw50tAA==
X-Received: by 2002:a17:903:120c:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-2292f948bb7mr278396345ad.11.1743606482451;
        Wed, 02 Apr 2025 08:08:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedc988sm110193905ad.59.2025.04.02.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:08:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <quic_kangyang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250401020840.357-1-quic_kangyang@quicinc.com>
References: <20250401020840.357-1-quic_kangyang@quicinc.com>
Subject: Re: [PATCH ath-next v15 0/4] wifi: ath12k: add 11d scan offload
 support and handle country code for WCN7850
Message-Id: <174360648187.2001642.16051086719382806496.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 08:08:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ed52d4 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=R2o3b0x2uHoVLtyVjMQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: pIZ68lATOjSpeU9zc_AM0EhGW3B5I84z
X-Proofpoint-GUID: pIZ68lATOjSpeU9zc_AM0EhGW3B5I84z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=979 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080805_373498_BB2BA2EF 
X-CRM114-Status: GOOD (  10.42  )
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


On Tue, 01 Apr 2025 10:08:36 +0800, Kang Yang wrote:
> This patch-set mainly does four things:
> 1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
> 2. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
> 3. Implement 11d scan offload, and update new channel list to firmware
> when 11d scan finished.
> 4. Store country code, and update it to firmware after device recovery.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: add configure country code for WCN7850
      commit: 1b68481fc1d8fa89a3d974b64a15beed2326c5c7
[2/4] wifi: ath12k: use correct WMI command to set country code for WCN7850
      commit: 773ff9074a79117d830b9eb006f3058ca6a24a5f
[3/4] wifi: ath12k: add 11d scan offload support
      commit: 591de41d7008585f2e7c35dbcf5922fcb4d79e39
[4/4] wifi: ath12k: store and send country code to firmware after recovery
      commit: dcfebfd4c8dc0bec9b6649104cecc09f5978c4cb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


