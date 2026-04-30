Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604EACCFA13
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=WVdrT1PfPYeqDDJ2KKpylLLBVp
	F6kCJgAVebSaxzKN/M/iTqKxayBfyfLUcaNOA036VGeYS85a5MeiC5LO0N58saxXUT6zGYYzaMtPT
	S3bYQ4KARc72/F8Zn52xheWWb2nlFmVWpQNLQaeXJCsMWgvKkNccEl2KeZUIlEBublqFRtifkUHjD
	wQCguS9Lvklcoer9Edcp+/GW4W0gYIh+F5pDPASohCrzz8usIRfUtiMa4BoElrvkuoATK1PuNms2m
	LUaJQdpGb73t0zehqYpmPCovsKQ03+o2e3vNurvzJzIJ46fji4XZw8u8nyhpbR0z8CtldeAKs0FeW
	acrM63SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyG-00000005z60-0XI8;
	Thu, 30 Apr 2026 21:30:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyD-00000005z3c-3o2f
	for ath12k@bombadil.infradead.org;
	Thu, 30 Apr 2026 21:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=BRxPbMZC0b0NScVFt1HHTKq9AU
	MMI6/wl5XFfuaDGwghkZXaPr/Ctks6FRnu4+x94YHFy6RjFD5dteo52X3cboi8tHcrVBTK0FQ38T3
	nNRxsd8a7ViLSCddR5KT2J3gffeeG4R+jO1KFXT+j+hP/4JfjqcECpy23elZWCqjZQAF8gxPtTzL/
	TnDqAkc4ve0KRvrIExgPUyjOr/ujIePxT56OaVwQGQ4+HK1hB1MJr/JkEaJkjLzTbu1CnLhkV/blj
	v52KiLRmQLbOZO3B2Kwf5WHNMZpJv9PWGruXC0iGaerj+SDfK0HNM3EhN5mU3eJ/gdSU0eVQDPPgI
	5s5zx5QA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYy9-00000008B6s-3HFc
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGITv52121519
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=KpcxtflHF1RvLzrm
	x/LpGvQMk5ePecYf541+Lp8GKCTwzWCI3tUaQt31d9/jT861bvBMMi9HGjm5xmoM
	KgIHSG2oqN7Pijvoi2gJCb+peObcavyoRWp2CndyK0uaAYwpNhtOlkjHxFAejEht
	8NK9E/6u2huWO/mo9rv144LFxvyF2M1GpNkhTRvAW1ou6aVLfr2qI5BNc/pdrlFs
	A/TeGctbIaGdNHLBzLb6Fz7sgiQtWqLhS4wsfBB0z7nafe2Iut60Xqaue90XJ7PU
	e2YlB0Y0ESBmg6jXoRvHEfU41E+JJJneP7mdyG2n8GynP9Q1HW05kXmKDl5d6zKI
	0foBKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4sc57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so2033322eec.1
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584647; x=1778189447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=hzjgLmbxhuI3H9smEU8U9OB+cW3K3tZ1SC1L9oO2yRGNsy1ZZjxE5c98n7dYU2jmqK
         9Nv3YWo262omjfpGV9kGg3itqZFJjfMnclImdkj45SQs+yjKCVoMlyF+n8QR7uLu4GXB
         kbId9vbHkDzDlcq9FNs0jyrf0FzzgCSa7gjDnIdnS6rnKHo3oFiqK/BJzWZuHYhfZ91I
         wilsd0vhkoMd6RY9FnGRy1uu/NFUd2AIDXcseJubtqRzL7mS5+bIGXJ/5trMCPv5ha6v
         dT5h1WhXw/weIbZri4AonphPtEXzhlJn5FEEldfPSM66kt83Dfr4X5S/AUUHGrAMKklm
         nPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584647; x=1778189447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=BGAH2BZvpzbgldXjjX80L6b4XLnZsHsCkgJBAaC6SIOffQ4iuKTHJwGzoKx64+NQHU
         xI+hBdoaNK9YGdFjuYWHbYOPBwcIJpl1IG2FgGbi28QS/iFbVblFyuhqBKfJZEpX1JW1
         k+s4m/7ztCVPBFzXFRskTt+tFx2c/pJZHSY28XIG4mrEbr50Q4HnKdw1uQFTXcSMAXx9
         FUZnoT15Z2m3JdPDSBfSwaru4R0qlQ8oESZTXC7ZEk9BxagOoqkr7VHkADTizEyPSo7T
         6RXzILq4VbyYtBdBQM0tJhq2xO7EpOTVCza8218uGmgU17/cmYIZyTMs1DzvhZotRLLf
         WrPw==
X-Forwarded-Encrypted: i=1; AFNElJ95shnCXVBoOiEwjxu1NZq92xqopCPQ6kzEmKiZrRdW1b0tXsvlfQOhzvGxyKXPpvpog9uJihc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPxc2RmWe8/tBmQISqMwP2O7nNbPldu87e0+HdHNdtWhuqXzMH
	zAEsULG6UsuccfYObMQSdQRTgOtc0zzRon5I47lrgtyCNTa+Nuw6SluFQfT9oMgUQaAN+/2LbGz
	oHqDOuya5idCGV14ZPsPigrKWeKIILIfHytoiTE4PYU+mvbxmGUnSlR/Nvfp2GVyt
X-Gm-Gg: AeBDievn3d/tMDwq0OGT2ny1OtvXmmngtkF8oJf1qPy+0X7FcOeGRGjY92uhYuKHXv/
	2qeDqHJrLWubI6/yYOBfGq7EgM7aEjy/Mtv6RQmzetRDtHO7F+2Taj4mhZPiwRTw2Us/dZim0Uf
	ysBPBAjTLMKN8Frex9L2ARdQ9o6/LScsGt97qDkY7n1MMQI4k/ZjAV5rNigbtFgDshZogIZKRtS
	bPtgmKpbwJ/nnnUMIgmHbeNorLMhfKOcpqq+XUNZYjk7V70lykqpK+lIcreN7siuZNUspp5tqhV
	ygi0zkH3Gqd1m980JrH6JHX2LaDgTJmTuk/1Fi9sXZsy/7rGiwpuE9KBL4BHE6g/Ocns6zqhOXN
	7yV51xZ8hF/5bw4vFWDhbHDPbAwwKatNVAmvCZdrWqJRBGUaYCt20yY+3HnhMfJzsuliii5mglV
	W67mwd4peKMaY=
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181042eec.8.1777584647396;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181009eec.8.1777584646856;
        Thu, 30 Apr 2026 14:30:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <177758464538.1848985.4937106435944960092.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: jMlx-swWOsXhTbyI8xaznXhXfeyQUTu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX7/RpzAfliUUz
 m/uPoe/VaiH1OOiTVssZSwY+oLmxUm/CXG88CnkWGdwyb0w6sLLjbUt8Fy89LFyUd6bT3LSJWLX
 TkBqDG3n4AJYO0SbxePsK9HHk9/znndBJmSYzzMrox4ZH1ITpIbkd+uTD6sBw4FZQNDPiPqa/JH
 vSCM0BLcnW1IgCPP7S/034k7a/euSDf33Xc8b8uk77O32lXs4QWemHZJGrneWLcM8syqTH+K++Y
 SGHPmeaxCUST7peBEy70dK2/Qy615NcMWjiY8yojgexZgvNeXaMV7g9JsDX92UZxxGeSRmLvoW/
 dd5ULFTmH4wRcTVZc39gnI3/RpZjv5QJiPCUPOKDx1I1exSy2pOU62OJ0RhIIX62MoU9w1kdiUF
 bS2MDlA2CHzTftk6tGFELZSsoktFr3HCJLLFLAboYT5WBfj6H7RYTWoqwz0/n6ynNJGrChXkanC
 9F93oAXSwQ2AL6sflsA==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3ca08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pNJNIoqo8oUBudG6fy8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: jMlx-swWOsXhTbyI8xaznXhXfeyQUTu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223050_699262_278CD9D6 
X-CRM114-Status: GOOD (  14.00  )
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


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
      commit: 0e39eea57626e545c596734c0d250c1735f1a7e5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


