Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DF1D3EE9A
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/54UclkpqOwxDHYahcS9J1UHOq2QTEmzbvlJzYpgHaU=; b=lXxQdeUKftUZPpuke7wbphR1Ps
	wBAY3uf0w5qkHQLP7ZoBkeerX9ZpiGcjMhEJgrIlkI7qxfUA2NZxL5gGFa+qcIz9V9uwSiG3RW4CA
	u6qXjSOY4eEfM5qm0OEHHw7bOZmfxE7hgVtKER2KVmN0xtlettovbWVHXtNOuQigd9jD3rYMNl0Ni
	A3VDlKdQKErkzh3xsZGGIy3tGSLO01EtChdryzuPGTffqlfdu9cAcmaiv4qsYopoHU2UBX8epuESm
	ZfXlAwpdS+wtoHzEdMBK/fpxKMcYKBhU7sN6+W7XPS0OIXb+3YO5hYXPIQImlxddhg/wNfMMk/0fB
	riN2smQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAy7-00000008Jul-141x;
	Fri, 23 Jan 2026 06:48:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAy3-00000008Jth-3jDK
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 06:48:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6LuK0324395
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/54UclkpqOwxDHYahcS9J1UHOq2QTEmzbvl
	JzYpgHaU=; b=B+VqoB/EAmTTAdLOc4UkMdAx/0avu58LVIOEQqZR88LwfQsA1pb
	iWFqo0xmeuI61Dnvlj5uc68Rm3dw43s1UlDoMbE8Ebw7JtrGJMx1oQunaooBiInD
	Fq024GP+dCGcih0KYdC/6YmCrFAtY7AYO1GPf0D11wt4gxN9KGcVaUHLeCeUmOoE
	STSf+aRdz+Z1YDi823kYJ/e0IOa15TANPe3ysCs7x5viIrY3w2HeIbEQT+ltZ0SI
	32KsloQc9PFNl27GjV90n82cKFMQ4uUmRn2JoQYnycOlVCqHuq8SkXWRw4vemBM/
	E8DdnDM1OP/arrDLntwXq6wVKA49xlLP6PA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mq82fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:48:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12338d13f2cso2278595c88.1
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 22:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769150905; x=1769755705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/54UclkpqOwxDHYahcS9J1UHOq2QTEmzbvlJzYpgHaU=;
        b=FBb1VdpxwvbABKY5WcuJchuXcoVJ6eFhZTwytaMPIVKmcaLFnWe4tCsxwPpb0TB7tu
         vBLw4oJShAKGv6ZvDlch6stcjlSOfJ4ELAHipoNdHOmSuYIhfHoVKwA8HEomaFjJDNux
         bcxZd7wUnETBit3rNihiaqJVDdf+OSlZT2gUllgN5UnSxQZ+Wv4+WIPBJxg0w3gaFS2T
         RSlvs0zRVcN/GWSQAyTNVjkLofIFPJZC4pGE+V+yLLPCh30XIndrkjxfzuIpfFICT/Ql
         RUBHhkxM5L0r6jAU5SFep6/au9y+Bk2IHN5I++2/bsTUHBgi69hlEF/CZl6vtysG7tPa
         ShEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150905; x=1769755705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/54UclkpqOwxDHYahcS9J1UHOq2QTEmzbvlJzYpgHaU=;
        b=DbJRI9t4/KN/4ZUhdDVobD9IkPMndlfedIXonSicPM3mmDSibmWQsrK5AsP8CgfaYG
         UZDO2F3+pkQCgpv+IkBhp4T37ZikILn5wq1IXL4H7V5/9PpONIT+ZDJqxNo/na8BM4Hc
         cxsvOmYFfMh2/D2hwPUAGE5g9mNO0VPSjYcqqD/nJHcM3fIWS97S4PV44iRZw3s0iY0a
         Ceeweg28tzUS1SgqnS3XDGUQXZ1yKzfrSMYcYQnjYrkZfcTPoZvx/mXQgVHD29o22/Tj
         02NVzWIEGgLU96zPYyv5RBqJx6iGqhxKFD482ImrgPB1eslvHAsOLFkEt9iytyCIJj6f
         wC0Q==
X-Gm-Message-State: AOJu0YxY7ylcQME8ltFgdIdyxudciZdh3OYucfixYuV8GYSx8NbSy2Lw
	wCYfI5e4tKLJvqAiabcfIs96hgMOBM629Chzein918NRj4u9ABFWSHMgsoInA3iKLyJOTaxzFIw
	lYaThehIMjE6osJdevMcnRmwd8dwEzsjFEI9JTvzQIQSEZOhkEwzHyHNu8NT3m2on
X-Gm-Gg: AZuq6aKz8ipwRZyAb72W7lPs3TLdoYvVutGxv6MTwG+ZjBJIGkQOUTpGO3EPuNJxiUg
	SxnJ4fX2Vk+NyA8jRxb08DWAjf9BkDmeBAD333Ls/iHBSxLS7djUql3YsDvEww/DTN0I256o18B
	JbsDjMCaZr/jkssNFY4ZMbi0A5EOnIKf3AEXwPBDernWOQ43z7lP2B37AMMTm8ZE/jcD4b2aIj1
	3UXw3kbwmi8jzxhDrJN7yirqycEKQK8teySoxKa9Ys55vSBB46n+xBmWlUzfTYkoy+b5CLK2A9h
	tpuoUhi5pkLwKYoQKCrJyNuseN/DTPPfNEMqc+p/l5+6xbH9oqmthmHGVCiukah9JJ7uIPdS5De
	W7sfmdNHoH2WEnndhAMEOfEMLkyiDb3deKabH9Xq8F6Hi8NvHMLROeOHDLBuZ2zAKvg==
X-Received: by 2002:a05:7022:e0e:b0:119:e569:f622 with SMTP id a92af1059eb24-1247dbfdd9bmr772953c88.27.1769150904828;
        Thu, 22 Jan 2026 22:48:24 -0800 (PST)
X-Received: by 2002:a05:7022:e0e:b0:119:e569:f622 with SMTP id a92af1059eb24-1247dbfdd9bmr772948c88.27.1769150904317;
        Thu, 22 Jan 2026 22:48:24 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90d13esm2819484c88.2.2026.01.22.22.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:48:23 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next 0/2] wifi: ath12k: Add pdev-level OBSS PD configuration
Date: Thu, 22 Jan 2026 22:48:15 -0800
Message-ID: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GrRlvgMnWquh2UCJ-EUwHz4KgzSMRDBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MCBTYWx0ZWRfX5bmOlCyIzR7t
 c0/bN5BvTImcrbeGWW7FUNx/EpC0uBPbJMvJiQTSay3ygvb/11NxoISp7oYI5HPpI2SUV+38Fki
 Mljkzmf9OMpcIZFNFKM/fd4TZLow3SmXQJNl8jGR6b9EmkwGVnweJQCVptTUt8TJIbMXTpOxg1U
 X8Bq7bLIvLMrSU2L1BLf/YI+DH72N/4mZHh20NghPqGegl2xgKzvz2WpAJA6IhIeNU9aGy0hHn9
 as3zYWmPlnX87g98UyuLt0M9ujrogBk/TUzjXCw/+BjGERnuzihI+R99tnIv7kz1AMjLD3DlcF7
 UDQHh00ZuX+Bp+b519HNKXGC1a4GsLWO8kIgHbMNpnQH/bltuVR1O0sKekmeaxbTmCh5q3ilUKm
 IF+L+p8jXASqr1icazqaThkUQYd+MLa6kpktx2LLy+djtJLMYCz6wE1/wz7rDHkso+RMDq5jzCC
 AoArHKH0UhNRIfYvZHw==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=697319b9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gbK--YHSo8g9L1OSsNMA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: GrRlvgMnWquh2UCJ-EUwHz4KgzSMRDBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_224828_045893_056AC208 
X-CRM114-Status: UNSURE (   8.01  )
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

This series introduces WMI support and AP-mode handling for HE Spatial
Reuse in ath12k:

Patch 1 adds new WMI commands, TLV tags, and a service flag to configure
SRG/non-SRG OBSS PD bitmaps (BSS color and partial BSSID) at the pdev
level.
Patch 2 switches AP mode to use the new pdev-level configuration path,
programming OBSS PD thresholds, per-AC enablement, SR prohibit control,
and SRG/non-SRG bitmaps based on mac80211 HE SPR parameters.

These changes enable firmware-managed OBSS PD behavior for HE Spatial
Reuse.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Wei Zhang (2):
  wifi: ath12k: add WMI support for spatial reuse parameter
    configuration
  wifi: ath12k: support OBSS PD configuration for AP mode

 drivers/net/wireless/ath/ath12k/mac.c | 170 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c | 142 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  47 +++++++
 4 files changed, 359 insertions(+), 3 deletions(-)


base-commit: 758064145fe77e06d07661b27dfa9c24fe0309a3
-- 
2.34.1


