Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4256C36017
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBteceZY1Uo0YtSu4ojswwk/m3kIZQD/mSdFMya/H5g=; b=EPVnAzgpHFzSKUlbUf6XIt8AbK
	XWCNwF1CFmGgMTHCcLcqrR7JE8e/c0S61s9Gw4bOFjWwP0G1Dz2EPrZvaXip15R7rc4Hx1npQhqTk
	o5k4JSPI1Jq9kJSuzFZuHcJfhpFYCEY+LVrKq5gT1akjBztwk6OhE0zrDfGKaCTaTm8TmvxrreKSh
	njQpY9W8r+BCPU9ySWxqf0cb6upzzx3CDBhKMrKfcSz5KUAL7PQN3C9WMTNVD4ACMXB36uPYncpLF
	0t+sBNDmdOmJ98Z7+IydIEHaTwmpllIUKQ0p9ekXvTlpElaHMQVtf/kJfG4dtVrnAUGsxxsaGXMJY
	jZkAuEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhI-00000006T4q-2LLQ
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:08:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhG-00000006T3L-0D9S
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:08:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DWUio024674
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 15:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBteceZY1Uo0YtSu4ojswwk/m3kIZQD/mSdFMya/H5g=; b=YRkK4sQPaW1t8Pdp
	F7MTH0HKb0xF5B65X0v+ejXnxlJQCJXd48bVQTW2CjNE2R88XpWMxE5N09Mrs0TE
	iPpz9bVO96G6ezlDTBPlTW9hm1XPKbtPUjYYx2pzeuqRsUi1g8TII5skEv8gdc5x
	zpkE9C3oW5o/CMLPVo6HHlDU2t9MxFCHsABbzePGWSxjiVghwDN0B/NU2rM1978u
	URcsZk7il2aL7akuniBuhz1Jn+3BPoG6JChC0scXFoVoo8/eAtZj9q2+HNibYnyX
	1vRrDHrqkQKMu4fatKcZnwtvJQQ4cxO4dtTeaCSAmd9+D9n1Q4oDou9flbxJsdhN
	dTaqvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvvvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 15:08:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22651aca434so126578505ad.1
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 08:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606484; x=1744211284;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBteceZY1Uo0YtSu4ojswwk/m3kIZQD/mSdFMya/H5g=;
        b=IzQG5uZd+xGL0lgrFVnrZDPJkai3qpJy0v2aaZPm+Q+9OjRwdtFHqG6lSjyIA2XWVd
         YLQ4eGqR3P3ZSB1HWWqOCLhP4SqpZwI8MRvPPSGAr+MCq4coRvpeVRtkHIU7/YXvc5/Z
         bV+jead8ZJrGLXIf+hXTTHfPmgTPxMt4Z0YiSejWo5L6bI9KSnPZejNuTyEBNZDc2y1t
         lAbexit2FhLYD93/4YEA+ixyhqEK+WEEo/qoeeLs+EVXppi0IvpvZK+sgk2XK09F5gbG
         P2zzMrjzI/3JHAIAaY0ikMENgtWev5pKfZy/whmdVKShCBj10opi6AehPhPcSS46Eu24
         DMjA==
X-Gm-Message-State: AOJu0YzXm6gKaiSZUTABnpdUT76mWAy/H6BTEm8a+FoMgIP8+XF53xAh
	8JvboRgDItnK1R0FiijUugffwa7pu6BX1fvJeSgMaNiWA50EY8oVOXrXyAtfaIGvxdEE0V4V3n8
	LpAEdQH2df2W78n2DYok6R0F3ezPl3PRx6PCCY6T48PYUO0/GXkqKr1pE6BXQRqiileN9
X-Gm-Gg: ASbGncv7+8+zk/5AOigFd8WY8HE+mYzoY+aIzarAe4pfgKMVj5Cg45ev5kIbi/mX7/D
	Jb7Bg7L3/Icw4KINkAr+DCzQ0J+E1rZWPICMQK29Y1bZyl+jdknPQ2+mV0b30miH9M43nc+ZNfp
	rC12S5XqACtV5mdFMshOwcf8YexDvPAtuGH12VRwvbExpeLZrF1H0Xuczb7b4NLEVgxPhuF+o8P
	CcYLkXnkS5CilMDPgY8B6nPLCQW4YogQkIHbXpiSQHIVTJe2tS/154rMDJbk5rRy/LNZIW7QiXs
	594PVyE8j0VJ4/NjP5r85xm+DzRhs/hm3kZWhqZrfC2wtCD5fHoe
X-Received: by 2002:a17:902:e549:b0:223:4bd6:3863 with SMTP id d9443c01a7336-2292f944b79mr284775005ad.10.1743606484132;
        Wed, 02 Apr 2025 08:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzN6HUSqwjsovI0Fsv36UQmBNgWvtimWXt/ZpE9qA6Cb4hWs2jNAUSwZbA1otDdmWBCpfUXA==
X-Received: by 2002:a17:902:e549:b0:223:4bd6:3863 with SMTP id d9443c01a7336-2292f944b79mr284774195ad.10.1743606483353;
        Wed, 02 Apr 2025 08:08:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedc988sm110193905ad.59.2025.04.02.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:08:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250401173755.1982382-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250401173755.1982382-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix spelling errors in mac.c
 file
Message-Id: <174360648262.2001642.9731556374991458213.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 08:08:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 5dU-2-dP3wShWepZaTxIa7BF6pxW6vKJ
X-Proofpoint-ORIG-GUID: 5dU-2-dP3wShWepZaTxIa7BF6pxW6vKJ
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed52d5 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=2oqTpBN_-z7nGWg3eNkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=680
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080806_096479_CB3BC6FA 
X-CRM114-Status: UNSURE (   8.95  )
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


On Tue, 01 Apr 2025 23:07:55 +0530, Maharaja Kennadyrajan wrote:
> Fix spelling error correpsondig -> corresponding in
> the comments within the file mac.c
> 
> Compile tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix spelling errors in mac.c file
      commit: 15293c1829d897065295750f1c1987f0ac82a890

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


