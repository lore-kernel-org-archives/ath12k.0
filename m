Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C2BC369D2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBe5yEeGf+UuSjj5OBmJ9qH9KWNCGycPW9ZT9dXwavY=; b=VE2Ms9ah290kUeq7zrcp9T7gfm
	2hGGDS9751mJM1Z/4vVJkjTnV4SNur2QgdA+EbE56W4KFqYHsinNh8KvByzLwTGdniRksEMEVEqXg
	1uscoGpyua9NEfPun0higFHnOMCqDTqbxo9209hZa1FViNwdGowGKTN4sAAkEha3H020Shu2KpfUG
	Rn3QF3Alo21HbqdPFzDUN2raB4IK6flZF/N2ZbF7nSx58ZIdOK0Gz/GgF04CohK6g+6j60bUsCdi4
	vGnD1J0gUD/p8VwZuLmvfahSfUoToSalZBxoRP9Di5FxkC4BS8uy3S+m2pwbYNhhTqvJg4Q94Yxbx
	eVdtDmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB1-0000000EVWR-0TCF;
	Thu, 17 Apr 2025 22:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAw-0000000EVRG-3XQ9
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClLwD013277
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBe5yEeGf+UuSjj5OBmJ9qH9KWNCGycPW9ZT9dXwavY=; b=O0Tn/v1ukeWnbqID
	aHLce+/pPhSAjUAQtfmDZeDuGiJDTTUltgRTqUYx5u0gooEFbj95kB52XiLhx2FD
	WLWKdVVFSa9aYAvbQoXnLHzApqSIe8gDcHXt5b67B4ew4e0yGs2k2tLQkhkvx5PU
	mAqfriwIhL6Qrw7eWaE/JTTJvBaoGY5ZuFw60w3mxMNvHC8eZqpIqvNycTfdRYTz
	cYmbtGGMitTA3AZWTdQQZCzdlnW/XOd4Upx2ekLN+N0SWA9uAH6SyCj0kXzIB02U
	IS9DTC4hTpqcaNhjylUyDDvC//WzaKbjLVCBu0K1s/gxSI/YufKNdypgXsPgLzht
	o2PHYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvdqr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2240a960f9cso12512005ad.0
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930661; x=1745535461;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBe5yEeGf+UuSjj5OBmJ9qH9KWNCGycPW9ZT9dXwavY=;
        b=dJay+byEUxNNHW7EuuUdEkbNalfWSqK1AqNQMwxW64Rj18jKpIGE5VgrfTUZNcj/2i
         PQ5BmY40IV6kFZaY1MbLPAxEyPzxgDcJpSzqbvq6jcHd/bjvQRRzEZ8ACTkv2EwbHNLe
         BFxD+oPhpPTfkJNarONzDRsnjChCfhqxhHHtxVJrJsFbSpf+c2E/B32C8HblguRCavhV
         D1At3Aor8I7ueJeJWBm768tJuCnGRC2148U/ez/FGVsj0i+HreeUxpXCpgYzUEVVPTmb
         s39ywNkTKcC1dSiceYSHO/KaYt6gwE+9Juy1w2QZDkrhOZ+leqn4AyTNJ/oOjYqbW4KE
         4xEA==
X-Gm-Message-State: AOJu0YzNxUauzyLl9SPNpKXtz0lJGGPl9KJQvgDu04Lgg1pyQ71ufcFj
	blHzK1+gJeiyPkMQG2Tk/VZKKWUQgKtZ/gjHFHICH8vvOjpMyUE5t5dJsGQws7Ypk4BWKxI5GrP
	XR0GkE6pIyBrqIyTBd6mR+4RETSj/Odol+vS1tL9nUyqxvxW7inRHxzwHbaxO
X-Gm-Gg: ASbGncsMpReFuC8IatUWND3zca7EARmEvPS4ZA0FFvcIhagl2K1lro6LbtzhGjlVS0m
	MWM1rD2CUQLOe6byZbvTuHheZfCcBoUQY2KnnSOKa77YvgET9be9vw5rDLWPZYDi6sdG6e2pLZm
	Gi4aqCDPwdHJQJ1Ud2zaJ1BeCCv0B9WjAN6yd/qLnnksirNAquC23vwbQWomQaOfEBtmcVzHUIi
	phW2Q23CTgagaNgrt9VGrFJJrJxAws+lS+9fAQGSTsvfJJU2l71w3JD46TiGCYmzXz88OCkiL5D
	ZYc5vABGvP8bYGzNWfYmxpiq4Xnu/WWam8N4i/8pe7lsKusY
X-Received: by 2002:a17:902:ec84:b0:223:47e4:d288 with SMTP id d9443c01a7336-22c5362cf5amr5903995ad.47.1744930661483;
        Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvEvmG9Yot8QP2JW0HLw1g6AvEehxxNNjsIE2nxnEb9Xh2JFG5Tuu3+SrVEmcw46Pkw38BHw==
X-Received: by 2002:a17:902:ec84:b0:223:47e4:d288 with SMTP id d9443c01a7336-22c5362cf5amr5903905ad.47.1744930661065;
        Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250416021724.2162519-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250416021724.2162519-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix node corruption in
 ar->arvifs list
Message-Id: <174493066051.1347382.4930327219533874514.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: S3D8hSsSLUiBLJVtn45GThbanfyUdsSf
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68018766 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=lD_GjUJNI_ZMVj4dkXcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: S3D8hSsSLUiBLJVtn45GThbanfyUdsSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=776
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155742_932307_F951D341 
X-CRM114-Status: GOOD (  12.54  )
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


On Wed, 16 Apr 2025 07:47:24 +0530, Maharaja Kennadyrajan wrote:
> In current WLAN recovery code flow, ath12k_core_halt() only reinitializes
> the "arvifs" list head. This will cause the list node immediately following
> the list head to become an invalid list node. Because the prev of that node
> still points to the list head "arvifs", but the next of the list head
> "arvifs" no longer points to that list node.
> 
> When a WLAN recovery occurs during the execution of a vif removal, and it
> happens before the spin_lock_bh(&ar->data_lock) in
> ath12k_mac_vdev_delete(), list_del() will detect the previously mentioned
> situation, thereby triggering a kernel panic.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix node corruption in ar->arvifs list
      commit: 823435bd23108d6f8be89ea2d025c0e2e3769c51

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


