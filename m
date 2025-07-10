Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8611EC83F22
	for <ath12k@archiver.kernel.org>; Thu, 10 Jul 2025 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/RmMphwpXUwtprvOSTHvrbX2FyNKRWzXRwfmMs/+4U=; b=L+wWnzGgCVtGN4O87fDv14vf7A
	j2dFJF8ySAuENMvQ6DWGT2FIcpQWgl/XqMEGzCRgeOQcXIccu7j4Gz7nMBhHiJHbJAkjHlhduQZIK
	UCewDRz9HrE1oijl8QZrUkc0OwNILXrdiRkHeHWR5I0GhRYrWFiEZ8jrtjlSPBm0OlekCyA4t3b2n
	eDCk9HiL2nhwGhSRajY6pSqOs2RLKAyLtYiwwVhNVqSCZ5XE15qma+j1AjSwsYfCrDVkQ1SdsWZBg
	DCx/CMTCI8AtGAKYMhb5fGfPPykvslIvzm8t9sjfEmg/94eypoS25jnY3pYD7LTcw7zi6R90FZ/yO
	SyNBQdKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv55-0000000CaKE-1B4B;
	Thu, 10 Jul 2025 17:29:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsNl-0000000C8Nb-0RX0
	for ath12k@lists.infradead.org;
	Thu, 10 Jul 2025 14:36:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9UOkV011308
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/RmMphwpXUwtprvOSTHvrbX2FyNKRWzXRwfmMs/+4U=; b=VgUcE23G+TZqCwrx
	/qtJiIx2mVaFIf6tZbLbmIS/VKRAk79un81KrYcuFM7OfyQHGsYH1GeHPgXPXWQh
	lwKiHQDbb92YKiyK7CM3eejP2VK9XuJwaFhEOBo5SnM7L3HYZ+V1Vwafjv1LOLS+
	un294NbS7L1KBdElLm+C9VwjaorVwgaZJj1cUv+QH0h8ZSZu9c8V1dkWgsIJLj/x
	JWg1ATL5QM7esPREaU+AYNtlxpzr9cV1iErBwQUXQx6wn2HVS5h+xO/NCYRck/fr
	Q1YWq5siC6Yv50qrIDsnek8wC8HRFqLn5ICL5OVy9MLmIlDWrvhn8gX0j4UT71QV
	7txoHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafn7by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237f8d64263so9991265ad.1
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 07:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158175; x=1752762975;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/RmMphwpXUwtprvOSTHvrbX2FyNKRWzXRwfmMs/+4U=;
        b=ZN6qDZAja0M+nSYlqhdM20quMvirFO9Ez2atbz4tiqbXEsR9dNa9KyJ1nj8coG2gHP
         RfO+ToapYYzMGJDIuRIVsvs2p6ZZZH/gKHV+8cq5qf26dfnZAHjLl+QQ1CWLo8FYMsMn
         1yc+0mKiNprkGGO84W/c2ajtZXe73VE2Xlnp/wKTpcqi2T1mbQMrEfrob0Au5w3U7M+f
         ZBGl5VvaYHa0eFWn6mXGOQd5R7CnMsygOaeL6H8H05mKeOWIsoZyVBwpCW1BhSJbudm5
         4FqF2woDRM7kGmFDmkVr/TCn9l2VDbR/QFaeb8AkQ6p6E5UFL0V33PWsCpi7hV5bCMqM
         NMgQ==
X-Gm-Message-State: AOJu0YzmShTSHEEUZF7kMxVNzl6PWe+F7dF7PoYRLuo6MVj/y+saRS/Z
	u/g4Vfi20AEb6SKw9CQoGRgXJ+H3I7B6OXJSHE6DVvR2/MKuQYS4eBx5GTrB7F6tkzYf0WOaeP+
	tfjfdoGHQWXEHlxkAIfyyl1PMYtGv6XgEwjQVvkbsmE2s9vBY3kAnVEOk2dCza70g/OISm4G3
X-Gm-Gg: ASbGncsmFWolQC9rIXiwsS0bVarLC+kZRD3ays4aKTSvMcY4xpcLgCiu5G0NTDrH3Op
	7Xz2gqhPZ1jpAB8+Sr3CAYL2v4Sm9MiMySJ509u2elJJait4yN6GSDYpmOdVRmzOdBlanZRWFTI
	8T6+X2dU0tBK+b8mf4KoY8Lo321pD69ZidpSskXGXAajq50nx6Mp9xughaz3qMSF+zoqP/PlU5P
	2exlJ4oHp1Q8PcXLcXQAWRC7Mr1sDxqAntWug9M0jNIchsn96e0lFp5h3X/0abkDS/N6/1Us5bX
	ggYFuUBCGuvVmppwuNycImEBE6GrmCf+z/B0I9JazxLHC+4E+0I9zGPXrzw=
X-Received: by 2002:a17:903:947:b0:235:f49f:479d with SMTP id d9443c01a7336-23ddb191922mr101468225ad.3.1752158174752;
        Thu, 10 Jul 2025 07:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+9kZtp78lUyXCZPidszEdeSIgS+85w2fVPdUcx7byKpJYl9YCzoFS6MprbaGw3Cx0jxncMQ==
X-Received: by 2002:a17:903:947:b0:235:f49f:479d with SMTP id d9443c01a7336-23ddb191922mr101467825ad.3.1752158174315;
        Thu, 10 Jul 2025 07:36:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359a86sm23758055ad.210.2025.07.10.07.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:36:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250605050135.1802902-1-praneesh.p@oss.qualcomm.com>
References: <20250605050135.1802902-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: set RX_FLAG_SKIP_MONITOR in WBM
 error path
Message-Id: <175215817318.507672.1199336449389284432.b4-ty@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 07:36:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686fcfe0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=48WJXGFCw6zJ8tVVsPQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2dLv2y2XsL3FtJsVH8OEmWJWwDmIFs_p
X-Proofpoint-GUID: 2dLv2y2XsL3FtJsVH8OEmWJWwDmIFs_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEyNSBTYWx0ZWRfXyw55BvNJU5qT
 pLqkvZmhbftprTa0+yUWqtQ0iQ5qUrmBj1AmdRk5Xorwz09FMkmXf1IsEUWE5yH9us+q+Qt9ZY8
 abIz7p/tGMEPn6lLn8I9OTpr3fN1/bc6ScIJtIbDHzeIi/+87Qy6sBk3MEOZVM7KfC8gv/W2Vgl
 zBC00+aNjVSbbDy6c42aEK2TJFiUpfAIjT+QYr9hLrNtqRK3/ZeKbIlcQzoxrXNYU7Jo/XJCtN/
 P+p1CXAQguNtoDXzc4oL7fCg8e1ChL3srHhd0uYI7eN5tTW+lM9l57+zgWKByhcfq9XdE0ehX9c
 JOSKcEYUzXjim6NsQMaCu8Yzfi4DDqYbyVXU2a00J3tFjDQTHn6uChcW3h0kKrv8iB69Jcpz5fM
 6PJKxz/XJb9aZDVOiV4ZpCZGHJGUwsjwDotSgxS81WhRTJWwIshxY9ATKySYTOSJ8vroSfS/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=758 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_073617_272869_0780DB38 
X-CRM114-Status: UNSURE (   9.91  )
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


On Thu, 05 Jun 2025 10:31:35 +0530, P Praneesh wrote:
> Packets delivered to mac80211 from the WBM error path currently do not
> have the RX_FLAG_SKIP_MONITOR flag set in status->flag. As a result,
> mac80211 performs unnecessary monitor mode checks on each packet, even
> though these packets are not intended for monitor mode processing.
> In regular rx path, this flag is explicitly set to avoid such overhead.
> Align the WBM error path behavior by setting RX_FLAG_SKIP_MONITOR to
> prevent redundant per-packet checks in mac80211.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: set RX_FLAG_SKIP_MONITOR in WBM error path
      commit: 0424cc3d70f6bd72e6501c730b1f95ba966e2ee9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


