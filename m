Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3E606A31A
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ASeiot4B;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHuuh9HF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwjYKm53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=; b=ASeiot4BYl72ULiwzvCuCzjIQe
	CVIkELQmpd/twg38TuXo/tHcPwNBJQlGlHN8Zcgt5UBMuxLe7ROeSSTFXjJxIY1pZm7Dtnxa3lIwp
	n5qHkgNmgGh7o+8ZVMaA9VAOvU8Hc6f9s4BkdGh7Guf3cVWGRo1MMUzTt8ds+rEESNu6FjjaCK4BG
	z7tTgB7BIVEJ7kVobeGr5wZ32jvgCmsyNZgiFxxSYu7vFnkaiJKpgXlhzXcKdd1iuLO02LXUmaCO9
	YgzzzJWXzI0obr+vhZ48WzFvwLys8wYwa/F5HTVJPCluY1dmmbrxqFcOSdNpJHtTpKpcUz+n0P7aU
	Ez1dl/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoQR-0000000Bzkk-1L8h;
	Fri, 30 Oct 2026 15:21:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoQO-0000000BzjY-2VEv
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 15:21:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCKl3564382
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sAULQRVnF5facmSRXEx8W6
	ksib0roSTKYLXWqipFzIg=; b=nHuuh9HFhLxMhwHt4xA8chCA70DCE/32ugMEm3
	eaUWtWiNkMveqs/Cg+hbRSfni2r+o6TadpI5WM+ZhtOjq+WUaZQuOG/0milJaXmm
	saW4g+gM97op/5RjobqAHxeoFqNs6Ga6Dz+CntC98ihAVrtaIHBeXDcZxa3Pufq7
	NGd9veSKkgrRMqUCYdoUqFhNEQP6CRSofK5vdCx2Pka4NnQqwdHwcUF3rpOSa/8j
	EivXRYoKl54oViKKMVVdot9FKPRfFMmjN4PKFGnPN+BEhAdXi5jvmmEpFurCwyEn
	kB6HKF/ED6ihac+MWrUPv474hveSowFZzdUkryWuomFz6AKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkps2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:21:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaf3f829b3so9577695ad.3
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373706; x=1793978506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
        b=cwjYKm53cCm/L4A0Uu/PSR0fQut3YyjYYa2lCh40742DQ7xSnpe7Ehw52RPaxstBKz
         TXJWna+S33vw23lnLRtAdrraq1sm9EDD+Wofs6APsnl+P9huH7CYW216AIN8V315/2QV
         CsaiV7KAST6U2c3+5C5MypNkmAWt6jowdua8S9ahmULk+HwNhqoC0dETSqEJWEISfUcX
         1BppxaPSg1VRpAL8/ygo39PGCwlImhOmuyqpor4Wj5Z61+Lke8GJSJl/SQn7ge0P9M5L
         Uy10K4CMv2jYCJtGVm06XqAi+sMxHURYtqQOjriApD3E2w/ffo8NqNZc3Sq0qIWCZ0xq
         4vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373706; x=1793978506;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
        b=LhILL7aColy5dGyLOeNVVBKoRyq9yW6tFiVL4lxzrI+bHIagv7I2ShRUqOe9YzMkVA
         CJOg3InstxkegMPGg7ImddFCcM0sIJ9AyHtUtiahvM9VaOYY3nHi6GGuJC/iGvA34Yrz
         EBAxdwHZz7xG/ZhpE65ww5VozvwPU4+QZVqqkl1qiwfHApHnVAeRvyJd5W6WvMcfydrw
         ye/Zosq+9+EEB1ZTZSSfwC6rUiJ/Uf2E5AKwOEXlGO9keETmdJuCgtjLTB2ZM7f15INs
         meffB5sXmmTWfavvrc3RSXwSdVd0MNCGjS/iT0cBFt6x+xpOA+YlMoKfQfFrsN5lz0bA
         2qlA==
X-Forwarded-Encrypted: i=1; AKwUvBzhiqRbKJQ0a5O1Xct/mwC751iz7vMqFnDUwWDk70iz2lyqvP4H9AEfnWb3bspC8mnR4WTtQWE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJTsqzWUgJuwPQUr2ybxDW44DbZPGrvymcTEKL7UdOeVOBcjY9c
	AWQdmyWc6DRnBhzG4hQDv0jr80aWJNFtesg+DaSFo1zf1C1fiuWPb6AC9wmYFiANKb/aDGf30mM
	WCWxCaKO2tM4UMicvdJ4Lk0sGfwM7nxSXs73STWGknPLzpee9/AzD4quXUsGP9VGC
X-Gm-Gg: AYBFou0RS9Pklo+3qh8YNuGuQ5MzzlCJVFmXEk40eyPpjrv8YWrssnjJd+UkY4z/lEp
	20d5GjtFEGnben+Gz/zF1lbAHqN0RB6r75VU18x4VcC2EBeaAeEnFGWqapTzkQFYOmQ78bBBeif
	MZc//ez+LmquT7qnPchVaiwFoR7HKkCq55IcKWT8IM7A65dGxCxpfvVSEeMXRGpyfd92P6bEm4C
	kW+s32pHZOrzgbncRDYq9GvEWaT2+oxWf0tqRQBZf4Dohhax4Hn0gOj7hPCKhzicgNzqtQWB8oP
	z+PPP10NbkryrmGq6OUc5EJB3uv2FDtq4JzD0ywxQO+dHoYZUcuae1+7tPM6H65FxUtYOvQ0hMi
	WS5SHAeW/CljjU3Yq70grOKdXkUEaafWwC2upsenm6wA29p+oXESIyxkiuUnDXEK4jaD/dLScvo
	FZWa71Mf0m
X-Received: by 2002:a17:902:e94f:b0:2e9:5eee:e07c with SMTP id d9443c01a7336-2eb36396abamr26900185ad.6.1793373706160;
        Fri, 30 Oct 2026 08:21:46 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2e9:5eee:e07c with SMTP id d9443c01a7336-2eb36396abamr26900015ad.6.1793373705552;
        Fri, 30 Oct 2026 08:21:45 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm8905895ad.62.2026.10.30.08.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:21:44 -0700 (PDT)
Message-ID: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:21:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261029
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SQW24n5jMRKFEjrj3FP9AbNjEjNgbkyo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXzF5a4ft/8tqA
 LORZpxlyMxYcGxbxH6FnGhFACFLvHSQn3WAeolvkBWaNZG32CZdueB4KIlQbRg2v3YcJN4oEsZP
 xdkA/rmx+xHe7xWii+SsK28/Gu+E+Ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX7l4hEjUa31HT
 tjfUiKWSvGVivCJUhhTCgEeBBIBLdsguioBA3RuGX4E65R1NLHQQiuSUIw96oDKoGrQtudc8KHO
 +sLklHd0GrwLif+CGpoQzoREot5pdWZcvfh9Y01TH21uVTtI4NxBv8tPurEqG1Ze1/32aQooeLv
 g4mrMVrKSM6DkQ0nljzd7NoryOisIFythCA8Aw6bakzXU25Zo3rxvHn9p5+Ue+O5hPafzdhSj/K
 WRk4lNOhhuJFHd2N0BMxZL233//ye1nQYANTos2a8RObAAuLI7GTS5WW0nrvZS1RYO3tI159D+K
 OJOgta4zwzaqlvBU6wBSZu6mRqtzoNTbVjWtRDjFpY3hV4XHiEwVtrZSs9072R4+xIJOYJmHNg/
 MsIz2tX5rXag7QAwKbZUK++y/PguaaKK4aoCpW3ShcxLGGFjqELefq2wG3ilrguZhAWqtlMzwTG
 qiIxi+LUvAHkBEi8bDw==
X-Proofpoint-ORIG-GUID: SQW24n5jMRKFEjrj3FP9AbNjEjNgbkyo
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4b60b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=qW8f3ulzRhYlp-s60KwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_082148_747539_10658C35 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k and ath12k.

For ath11k, add IOT-focused NFA725(with QCA2066) firmware and board file.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit bcf20866cf559c19e6f33b10266fde45013e60b6:

  Merge branch 'rubikpi3-adsp-00256.2' into 'main' (2026-10-29 13:06:16 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261029

for you to fetch changes up to 173aced9dec7af5541d50ad771b5578927426776:

  ath11k: QCA2066 hw2.1@nfa725: add to WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 (2026-10-30 08:08:40 -0700)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1@nfa725: add to WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

 WHENCE                                 |    4 +
 ath11k/QCA2066/hw2.1/board-2.bin       |  Bin 745440 -> 865704 bytes
 ath11k/QCA2066/hw2.1/nfa725/Notice.txt | 3658 ++++++++++++++++++++++++++++++++
 ath11k/QCA2066/hw2.1/nfa725/amss.bin   |  Bin 0 -> 5140480 bytes
 ath11k/QCA2066/hw2.1/nfa725/m3.bin     |  Bin 0 -> 266684 bytes
 5 files changed, 3662 insertions(+)
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/Notice.txt
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/amss.bin
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/m3.bin

