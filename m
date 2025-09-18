Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E56CAC59A
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=216aGmttavblAfmxtYmqgHfbJMwZU8PhIe6pQ5pZYfg=; b=SKKqxP73d3ZfZSATcE6Pc9WB2T
	VHCcTQx7FHqIAiPfyp6uXn2DPselCk0Fes8CXTfaoIsK1u/dtJWMQ4PWAIE4mIpFoXp/AJvIlodHx
	zRrHbpyYOnU2ypNAb3J69hkte8l7bdG0JDUPWPOpo1Y/KpyaL1dmQqk59rTmHdwwkUwjuL7V8MdKD
	0UAo/LzcOMlE7Tc4K77F+aSLcOtFncAB/8N1SKMxWCaC+U4e2gzzI7lijsN1pxNFNhm98v1T8GtOF
	x5Y3EhdAA9gWUMDN1U73JnH6kvh9QoYg4YXgzG0qyugv+/ijwMswbYp89CnqxNGoynMp1fKLHhjGg
	sIswXMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJ1u-00000000q9I-2qYT;
	Thu, 18 Sep 2025 18:06:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJ1r-00000000q8y-2xOg
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 18:06:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IEeUkl011008
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 18:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=216aGmttavblAfmxtYmqgH
	fbJMwZU8PhIe6pQ5pZYfg=; b=jVgd9L0W5gAZ89DPwmreNCe5zZSls010LhK2SR
	nMs58oDeflAQFi4i1aBdIXMMxTOjSdlqaBLojisk7uaHtVw8UKWey8tmSZ9tl6d8
	zm84TPU9oaqmxPePF0gZ2dYnxj9G3+q08jR+ty6iVCqlyilb0AgdxqCfXcDj8liN
	ylDuwOpC+S2wtsp2JwfZuDZewiU883zD8C1a7+zJh5Sx+3Fz09n4m2twv22qytIx
	MXXtUY6or88Z+UMeaOE8G6kPVkunKXK/z2Tdv/wZiJmyawndMtOZI9u4Leb8wlP8
	Rn/TQJgqXMtUQJtzqTKEU188dEPSTxEUqNTwZE1nVYNZh9UQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx3deg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 18:06:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26983c4d708so11797005ad.3
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 11:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758218805; x=1758823605;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=216aGmttavblAfmxtYmqgHfbJMwZU8PhIe6pQ5pZYfg=;
        b=A7HBkNS5rBtcv3WApXc8jK/8Gqn9Xo7q4/mIPifA473wnDGQjAj9JsFttaQMsUbj2P
         XN8xCM2+j1/WcBmXUrYvTnL+bmW4Uk0HgYMtl2fxipqkNm3zfQwKBw3QtB8GUmTtd2Nk
         3Z6rTmtGVoTXNKkQivWXndhss3uTirITvZxxT0TH6ejTQl+8ua2ugSqLolS6QbLeVrUH
         npgz2qAJqvp0Kr2KbpkJptMTfQq//sdS+jDz2FvyW9zafhXIXvq1dehcd9h9MvtSHG7D
         bUcdNkpZxbtD8WS/XaMClQ4FLwAtcf1+H/JOoRx/bF/gabXg1MMhBfkdSPAVCS1vZbLG
         ijcg==
X-Forwarded-Encrypted: i=1; AJvYcCUss0DwQHPgC91c6MXac3NzSMNnOK4oLoX4+t2ddNeNMu+hbblUUgldRGp/nv5ggIVk8M60MYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YweN6DnzGp3pdQltdx/vCG2G6MTeSF/X5C1OP9gPbbaw7mmb6Yn
	GyLTlzFESPxcxC/jF1CUD7LbrjFiX5REEW6aS5wEHs6a0jQtiUQCVtxPuxQaCJewqYrurS7mY+g
	3rLb0ovlTbipgDR7rvNF9z+C9a3yhJjyOBt3KYwTERW5wCA244fiWdjaBJ2kYi8kp
X-Gm-Gg: ASbGncuWciTvryV8Yf0f0NzNMc63FUNbf+XCVwFi4PASfLRGXmAas0Dx3c1csj8yyd4
	MqHSyv0md+QuclLP+KoMC5mgfBgUks+Lx9KHGryLjk1ka3fycpVycXRXWUEx1VUURaoZHDNtHk0
	IZs6D5WwGnBrRsy0pDdpWAAnClfV+jDeEaatYreGKHB6tF7FAYln1ezdx51LVdCDQF2L4Utxh3s
	FUGg71vOC8mgaOaTihHYX3xcxPCGPFJmpMY8rrog7fOcSKpIO0OEToDwAPy7ljTO4OW8SRoDCl+
	WikqXtTluR42xU5ALNnsp+PUnHbmoQDOE/ffrIz1S/5dV/HcOzPnxDjZbTa+SC1Da5sTYubkUt6
	O
X-Received: by 2002:a17:902:d487:b0:269:96ee:17d3 with SMTP id d9443c01a7336-269ba523685mr4906285ad.51.1758218804915;
        Thu, 18 Sep 2025 11:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU8mGCWRPd+psvoKsiWXXqf6YywFbV+i/dLZiaG9yQ9bphtKe7TmqCheJxRks/sB6c9EPyDA==
X-Received: by 2002:a17:902:d487:b0:269:96ee:17d3 with SMTP id d9443c01a7336-269ba523685mr4905925ad.51.1758218804345;
        Thu, 18 Sep 2025 11:06:44 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de7a9sm31863505ad.80.2025.09.18.11.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:06:44 -0700 (PDT)
Message-ID: <9cadcd6a-5f99-4a2f-8aac-c612f355d82a@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 11:06:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath12k firmware ath-20250918
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jksxVNC0y1-B8bT8xLllVa_QRu4tYZtJ
X-Proofpoint-GUID: jksxVNC0y1-B8bT8xLllVa_QRu4tYZtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfXzSZk7OeTnXth
 fx9+UAHi7S6fuDjNmIY+kRc2ymkh+4JTRwCoZnpsyHfngq46VKIaTjHpZebSVSYKG9fDqToziKp
 pnLlwCNe+XqtMxaCTPGil8gEhmQ+dgFFegLS2OmzY46f4bubVLT1TrCWcAOqkm7sA6lltxGpwlK
 MgDMtk/vG4G6Ffc5L3w3lXgeEw69SPzY227diJTyzcWfW+9fXXsupYi/eGI8vFBj8P1cVKe5jmo
 QfqtnuT2c5FDY7giUA025uPr0A2d7CNAdqplxPOt2oq9tHOs3SjIEZsfPRGIgWQxZc/oG9okaU9
 F5HUJnmMhLfnI4gel2M4vaZl+Ig0ODqi3FyLccD1RLVQ1RRFi7bS2QVCWeRknmGu7kZt8+WqrLy
 kCuQ/JrT
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cc4a36 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=payZvAD0jBNu81Yx7e0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_110647_865502_D8C32ACE 
X-CRM114-Status: UNSURE (   8.79  )
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

The following changes since commit 37f3f2d8e14cff7b316616924331d57f6ec6e259:

  Merge branch 'robot/patch-0-1758163077' into 'main' (2025-09-18 12:26:22 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250918

for you to fetch changes up to 1d588f106ceea113c4c650b43d948da5746e704c:

  ath12k: WCN7850 hw2.0: update board-2.bin (2025-09-18 11:03:58 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 2253732 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

