Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECD8C021A5
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymCGsRh673k3+51lFOExPinq3U9WqfBeI2CDSIUeZQM=; b=uMP5nw1P2Xn8qovBQX+tKwWTbU
	m0sFG81KE8T6Ho3WVUA/U7i5Sff+zLeZf8cp7MzZKodgOMzgZItDQm5c38AuMiSiHXpjyP/J2s/Xx
	gE/vOm2hQ3BYnrQu8siNLwL2ppTezKrR+OtBniZrZn7kFW02nQK6I8jexh22vQe/9GhxDEZGYxorG
	JlohHb1uqWnlLlBWj+zscDVEcmNiZTn3EjWqYfPv9ojsG0f40PRt0ZfONXwVMYkdkKHaJ1VooGn/+
	eeeZtfTIKkMuHt7iNhlQshiMVSDXRlprLgIso8uaI+iTQcK3Awm+IklbGxZFMh/WJTHe+1YXLH5Hb
	HIEbkekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsST-00000004LQI-0TD1
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsRE-00000004LHD-1Rc1
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BA2Q8p013667
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymCGsRh673k3+51lFOExPinq3U9WqfBeI2CDSIUeZQM=; b=iE4bB9Nzmhx1S89E
	9rnrK2o3152xJ4KvUE0GVZq05AHLyinFghSTBkoYKyXyjc0dM1EXgir6lETqqSEg
	4Fc9tKdZ341vs+giDWNXENL6wKx2d2/4nAnfsnxLPXI3Pg9xQrIq7bAqA6UT7gTc
	IvCDjtnG0qsSrevUNZnKKLfQh9UJYdoTp3CAqKR63Dm64G86h5jMwbx3PNnSSkY4
	mTcsD+ZhiqGe8lwB43Xp1D5aiyHtUwmSYNX19MrulbXMII2+CjhRUBXqTe0GkK6i
	pVFRSo3npkAG7vM/8/Wz8/tTccqivSlgHlsa23jt1viZir4KRHQLHM3agxPaIvxQ
	8uGkMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyr8t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f5067e443so71050085ad.0
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288679; x=1739893479;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymCGsRh673k3+51lFOExPinq3U9WqfBeI2CDSIUeZQM=;
        b=mQbQAbfxI0Ezm3rbD4lUNV96pAMPKAaTteRgECvQp9ErmW6imGQUXWs6Abm21eaAA7
         sTHzqFm9lQJnGHexkiePiXIPy8jwthAuCHNCdaBWLeM2ajaaz4MOjP/4S5na5mFoiEdj
         2VyHxtbrhbSqsVDpRPhzew1Cz2WYwGGAxd7vZ/tBLl99UJTDvhQdqiAdE2lfNUjqQOq1
         hua0v1n1LInJxQDKEA8SAtoNVI8m8WLn/LTm0lbA7OAzNTMWdJL8hl59XCX1r3GcH52S
         MazjV3QTai4puC8jdj6js3mHV9iTHep/TUfEkrOaSCta72pNZuJPp3EQGoqbRQmsxgze
         a9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPuCy7WyEZvi1kG6JNsUIO33rTdnGEX7w5OD0qy/x1cg7Wrbvg7KBJtaH9KDsXYLMbgBaSwhc=@lists.infradead.org
X-Gm-Message-State: AOJu0YypT6W3Hh+kVtvudgqD73FrEn21Of6EhVRnZbPjKA6NKLxJgU1v
	r4xhyubRC+LVxrJ0TR/ZtJorH+y+quZB5I9Xp2B0JAVM9Jzz8krynTEANQgyvDbsT3U0MdjKcZ6
	tKLiZLuuY/K9Q3DO/daqCqwyIvM3e2a+j1h6nBpC4mKIOrfMa4fM0FRxOjhnB
X-Gm-Gg: ASbGncvOZYw2/yXskUDfzNTkoHrpM9noLJ8AyATm2oYsADSh3IU/MHjeKXB+nbXSgdH
	dj+6UIz9uXdxWWZ5BBpYO5Q/GsLMMno5ICaiiHQGol6XbP+uKM4iPhYHYbS6zVrkppgDTN5maZL
	J8jFfYrQnOvO99bVuQD0yl7IjmVitlmTzoh0zGjborjci/28voS+MDSmesAzLVKJxNw1H962JB7
	k86nIoBcv5Yy3anhbwgFrtZwbSGO/wh4FtTu1e/AQAOYIAyyLYq4uTIntgzoRHJucDNzW6QoOqL
	Cw29aBRmVLF5vL2FjMhSwvHUndVgdaAY1/9GdgDLrA==
X-Received: by 2002:a17:902:cccf:b0:216:31c2:3db8 with SMTP id d9443c01a7336-220781ebe71mr2486345ad.37.1739288679008;
        Tue, 11 Feb 2025 07:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgblWuZwpddqv/+atjEJ8t7ZVVqI4cMpZn1gJmiYamen4vJr/3pWQhZY+woUNf/9hSpTFJJA==
X-Received: by 2002:a17:902:cccf:b0:216:31c2:3db8 with SMTP id d9443c01a7336-220781ebe71mr2485995ad.37.1739288678577;
        Tue, 11 Feb 2025 07:44:38 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:37 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Bart Van Assche <bvanassche@acm.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <20250206221317.3845663-1-bvanassche@acm.org>
References: <20250206221317.3845663-1-bvanassche@acm.org>
Subject: Re: [PATCH] wifi: ath12k: Fix locking in error paths
Message-Id: <173928867747.1115150.6634049107701596787.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: gfWbIFiSe8PRCFHnE9QicNnztmODM8PS
X-Proofpoint-GUID: gfWbIFiSe8PRCFHnE9QicNnztmODM8PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=664
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074440_391865_B8D0B87E 
X-CRM114-Status: GOOD (  10.15  )
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


On Thu, 06 Feb 2025 14:13:17 -0800, Bart Van Assche wrote:
> If ag->mutex has been locked, unlock it before returning. If it has not
> been locked, do not unlock it before returning. These bugs have been
> detected by the Clang thread-safety analyzer.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix locking in error paths
      commit: b9c7299a3341a737622e4de45b9c27e60ad01e3b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


