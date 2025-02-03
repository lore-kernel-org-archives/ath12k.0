Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD223C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 22:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw7bNV05959ms6oss+YF+4qJZNr/KZytbXPLNUurobM=; b=VEd1Xu6zUxV5e9Bcd+t+yVbxbK
	Ts+5RLT0hIAZsKlCeZnmXu4ixn/Gala7RPpOMOkW/P0ztDS91MIBPtgvzT6yj82dG2Q9/clcWDC0X
	rmGIFrI5S+CG+0xsrqTyDn+ey3LRbHMgCOXmlOYXZPPbfz7NfmfOCvCPmTLckY9TfkNnUMdcwp5n7
	Q/KG0XsRGcx+d/H3p29ekl/aL/jbhhBa8Cy2GAaf5Q8xYNAJJLqzzywgyJOFtz2kKV5ULtz+kbCUq
	KANgGfbRWLa3T3XeMzzlhhfEauLxjqAcPLTQVv33QLwEYtGzx5ihicy868/zo3wpkgj3taykm6q22
	24PUoXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fh-0000000GpDy-1xf9
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 22:49:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Ff-0000000GpD7-0EjO
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 22:49:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQf2R026948
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 22:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hw7bNV05959ms6oss+YF+4qJZNr/KZytbXPLNUurobM=; b=TlsGb3O+0wCAGyyt
	TbjEp2XQVfuCz34of4l0mDy2Znw4AqVHPY0UkUC7Tq+ees+9ILfuCz5yfeiw9QjK
	pZZKErkqZF4RTHMVy/o8fRF0uur5V+hpGWXKHlBKbPX/pXI4wI+BpNmoTdeWwHvP
	sDlcIyGhOWXb6qKDAUD52/RYt1lZuYOZWPtceAL0yAxno5kjW8guhYKl9uGlmJAc
	ClTnYJGU94lE9MiUuxrKJfxqpOctKe0MxeRlJ5UqabeaUTE02x5LfAVulD6PSwvo
	bmQh9VWq3rhh5lgCLDEyqIrlzI8F4gvlyiMhOOlqzRxPhSbsM9V/ZBAb9cjIcqDp
	zaZJBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufr8gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:49:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so13928542a91.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 14:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622950; x=1739227750;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw7bNV05959ms6oss+YF+4qJZNr/KZytbXPLNUurobM=;
        b=QYzm/BxCnRc6rW9p0BNoNVltZ87ggY7VN+Qttc+Jaa2xLBh9Wh4NT1AMrKSXw4h0uv
         EjueGqukwOWgGv86Hta9JaDIYFbzqsPaiME5y1jb4/meXMGm1YzlEuq5vYaS8ucIa+w/
         Jyj792Ppez18ItoP4tmsgTDGkOHJLDDDRaor55yfRLUBSyxoifhh/YiezVTMIjOjNUxU
         JHqgAK7uJAL9d8qf2R9s5Eu90HpO0fzt8MR5SJbAkHtCyM9GGgKWG+cEP9yUuMvrYgEM
         GwWfvG7PB68aVEoX1zUgXO+444Y86UrWUrt04Eu2l5sGv+Q0BoplpOspuABHSi8Htyik
         EPqg==
X-Forwarded-Encrypted: i=1; AJvYcCUXq2Jif6JhegItOQVeipR2Ye5XH8C0wgyY36kPgriQsE0WoErPpZuXicWMcOuEPLkgbRGG/18=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYRT1uoqz0cKeoPbIbHGcBX4lv88bm7Y5rQEHi46n+jS+KHMAs
	BR/luoo/H34ehBFLf9ARXWj9qnCIHtK+w70ObdtVleAsGQGeSQaMvKAKAKlLJnZqtAqkuSIoaOC
	I1ykYKO2q7vVLooRZaGpmrXGY1B5c4t/xoh4ppaZaqRHwosx18xRFDJEiCVna
X-Gm-Gg: ASbGncuQ/bq2jpjklPeFI0y1Kf+SwnyFKWYNSl+NPcPJ4LlIJT16tsGBZx3gQ+bgupe
	aDt5t01hnoIth9CkwuNpSj7xIsx3P9HiuqgHkIVuo3GJSRHS/rLbHNMzksO4PPO8/VR1Th0DBbZ
	4rRTNc79sBZCuxtS1PLbBd08czoohDqWWjm2uiZ1TZb9qmaKc+uHVjA3/fKzS1k7gAeIfw3x+TX
	2jCf/QNDpNI9pgVcGpXKiNq1rOVizpMSg1mnxYocA5sAiunv89eWLhLUcttZykxdcmAp7w5fEDb
	L2RLWPH+0xjdFh+x4Ysc/OSKw9T0rJnWayKCf14Gfw==
X-Received: by 2002:a05:6300:8a03:b0:1ed:9abe:c663 with SMTP id adf61e73a8af0-1ed9abec6e5mr15242515637.10.1738622949676;
        Mon, 03 Feb 2025 14:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLgkO3wpYZ3B0nMiUJkb7E9OU7kLXT89O26RAqf3BGd34605SKsXiAulB5vO5cyrzb9LtnHg==
X-Received: by 2002:a05:6300:8a03:b0:1ed:9abe:c663 with SMTP id adf61e73a8af0-1ed9abec6e5mr15242499637.10.1738622949298;
        Mon, 03 Feb 2025 14:49:09 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:08 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
Subject: Re: [PATCH v2 0/4] wifi: ath12k: add MLO CSA support
Message-Id: <173862294852.3734728.6340802985504252357.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: xjwNPAcdTF7H_UDH9-hGJNtE-ff_p2yA
X-Proofpoint-ORIG-GUID: xjwNPAcdTF7H_UDH9-hGJNtE-ff_p2yA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=940
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144911_122638_090C5A2B 
X-CRM114-Status: GOOD (  12.15  )
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


On Fri, 24 Jan 2025 11:46:34 +0530, Aditya Kumar Singh wrote:
> Patch 1 and 2 are pre-req fixes (applies to non-MLO as well)
> 
> Patch 3 basically uses arvif->link_id to enable MLO for CSA while adding
> support to update counters throughout the CSA time.
> 
> Patch 4 fixes a potential problem seen when medium is busy. Again this
> applies to both MLO and non-MLO. But this is exposed only when Patch 3 is
> there.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: update beacon template function to use arvif structure
      commit: 4094445969740028f9b637977781b73b64c5bc7c
[2/4] wifi: ath12k: fix handling of CSA offsets in beacon template command
      commit: f9c88d65e805ca06f26806ac99f569a3dfac2229
[3/4] wifi: ath12k: update the latest CSA counter
      commit: e26a6989b10a3dfc97b8c206023a6bf3a3ccb94e
[4/4] wifi: ath12k: prevent CSA counter to reach 0 and hit WARN_ON_ONCE
      commit: 36f002a3e36efd3370f5b6abfc157e7481ecb1e0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


