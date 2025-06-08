Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD557C5AD49
	for <ath12k@archiver.kernel.org>; Sun,  8 Jun 2025 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y3MrT2w0E4SzGXJtrJUWL3yg93uDkQIiRATI5H081pc=; b=RZgGKXlUyJ/VonsGiaOlNNde52
	GZ8olWgtcjLklE9E1H+HDYrzYqci2F0L4HI07OFAsFnQ1fWQW87xQahT+3duqOWqzf53zd/0rUEHW
	Z06RVffcRHhNqpSprIOcGgdZesr3eA6pC7lI9F9bgaTOy8u6EiJKDWAdo10X55xo4F0r/kYWJIfyI
	d7nEQ52nJN06chPKnCw0MSxGLNFQF42K54EnUzMWEvrxMcZ4WSPJaeSINJAOm06hqnzW8AJysXZOl
	rxdWcmdIhFys3G8kH12b1acExM4sWEg4BhjPN0CXi84R/iP5P+1CM5f61Xf3+eGw4YwznVubl2gUb
	Ja3VfcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJV1-00000002obp-1J9o;
	Sun, 08 Jun 2025 17:07:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJUy-00000002oa1-2Voo
	for ath12k@lists.infradead.org;
	Sun, 08 Jun 2025 17:07:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558DWS4m028873
	for <ath12k@lists.infradead.org>; Sun, 8 Jun 2025 17:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y3MrT2w0E4SzGXJtrJUWL3
	yg93uDkQIiRATI5H081pc=; b=i/VhF9hOuJOWkT1hD10lbSs6B80dUFT0/z7evu
	B5vIj8f+c8w1DfKYdX3MF4TeI9U2JWkxH8fhwpoJz1wvd4xVh7lyLXxHsQ6hpxNk
	RCpulA+xGwgSf68ff9BAVYwIzR/RwC0VczeooET0d4++gF61nadvJiyLNaz3WYik
	8qQHtx7xeo16I65Ey02xt6YGWHaTm9Aspf8KD51KrEEUIppAs58bRzTQ/lWKiPcl
	k7CaDWNUbm/ikRs0kLtoK4xCsjlN4bE9/wcfG04m5yzUgexY7/BONWSarWmVOGgc
	5I4zBTH2gRVLwAmaybtZDL5rR0Ut3nv76i2h4UDL5CLNIjxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9kgmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 17:07:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23228c09e14so54374385ad.1
        for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 10:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749402472; x=1750007272;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y3MrT2w0E4SzGXJtrJUWL3yg93uDkQIiRATI5H081pc=;
        b=ShRYZ2q6WBybyZiU9YsmwOvWiw/FktHxU4xADZDVKw6PlFU55CDOKQ1abFncaALuJI
         U/P6mZlkhNVvhF444ojeI8GB+g6WkVTc6VQCbIt1dPzBiFWVji+d+eVC3oRlCXxp7HHc
         ZkjQkbxBDojbMT5yIUoWrpuHnRVpql7qcCsIsyN9dbV8wwEYx9GbNrcP4kfzEqNk2w/5
         SX8N8a0ZgWNAxBEgKxLQWlLjqbJgsT9/HeMSYvlve/TazG/E1HaOY1WBpgcuOe4AfGak
         FUJIIb/su/txLSu+dWTlf64HddFzdQVSfBp+fCIbcW7yJKZxJmNtlzL2F8gel0YRhabG
         dGWw==
X-Forwarded-Encrypted: i=1; AJvYcCVQMjmU0+UDKEznDn38Q3koObBOUGMG6wgdw9sAeJDITlmHQoJonlx7MQWjjuvpD3JV7E8GxpY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9PaBD7fNVvLSo35S/YwPb+XG2IqP2Et2p3J6TW5osm9jRXpNP
	cHOjUUxTY0k3ZZKHmn6JqNKJz61g1FjtzsXAc3f2HhdOea2Tl2fMXHls1w257M2X1QLGIPqo+rx
	hvQ11uIOokGT+1qP0VCG6+4YQ3V33GML1TMooQRHXAaMVL2qA38TtMy87BxSEEFRH
X-Gm-Gg: ASbGncuI/2MKTUZpVN/PzYLmfJzySJ3n4jKGtDHcj4wc9f8QKFmjsrpGbW871wEP/Qs
	pb7vHp54/i2UwSlvTZY26a+d52I3owRVIuE4ILvVYC5YUFUxuvaQiWi7zYWD8uqRC8VJUv0saVJ
	P+3ErRvVCV9cBDLFyMR1g5P5P3aOPM3nu1EHT9llCahyjv7F2cmks+k/chKbuyiRiRFfICSbz4u
	XhLs5nfVHNnDQlww2KvvPtqBs/Bo3F94ShPPj5kXnHQunPKeys1W2+jsIG/+mCLAHulgP/bz59d
	5yIVt1mFr1U2mY75Wqn84GswYbUkIys1rXqnAlW2RyYOnjAjNYCPEcNkpIM=
X-Received: by 2002:a17:902:c952:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23601cfb69emr151020965ad.14.1749402472249;
        Sun, 08 Jun 2025 10:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPF5QYVXldVbJU9+uqJzs3oYWjXUWO5AZS79gxD1TIb8AWh0wWhXGKUy1/A7ATvW/Qpi4ApA==
X-Received: by 2002:a17:902:c952:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23601cfb69emr151020725ad.14.1749402471854;
        Sun, 08 Jun 2025 10:07:51 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078ca1sm40900605ad.35.2025.06.08.10.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:07:51 -0700 (PDT)
Message-ID: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 10:07:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250608
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=6845c369 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=wYb_BKVbZVJNipbyvL8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ncAcjdsq_-u_ro84T0HcHejhCys20pMD
X-Proofpoint-ORIG-GUID: ncAcjdsq_-u_ro84T0HcHejhCys20pMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzNyBTYWx0ZWRfXzh9pQXVVNj6n
 vhhYDhAOZ/AtDAgZJLuIb3Fml6u1b9GKjWO7PF7kX2EkUWC8FIyLqjreBUnMsT2v98xF3ndgONU
 2iyO9zSRSVjxJW1QSlTdWYkQGjJudZhA0WPlkzTFEG6zJQyncwxlXAREy1SToDWqMrI1ckSJ92B
 uJWWPdjCEMba0Bn1l4nhDNP8zfNFOqeQXPdEkt2+2J8D6VASz3nndKxHMkaOA8jN4ia7GSdyeir
 NH5OKYvULxcdMAlAKyA/izzxH6jh9LHvhePPM5DP0QK19jU3qx/N0Y2JXH7roskDH569kbXbtOx
 3sBqvLUED2Owgqeq0g0P2S5oaeXQiVlC4mabu4r8UCRm4WtNwzZhe8wqxBoODc6BEtupju39rhT
 yjRk5kI9J5ZStoTkAKraUR+Dt6uKwY2U0bUd7XaeSunHoK/a8aMYrmXIcJLePNh5LJbP+z3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_100756_751065_2F347D66 
X-CRM114-Status: UNSURE (   9.17  )
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

The following changes since commit 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21:

  Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2025-05-28 15:24:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250608

for you to fetch changes up to f3fe49dbddd73f0155a8935af47cb63693069dbe:

  wifi: ath12k: fix uaf in ath12k_core_init() (2025-06-07 07:41:50 -0700)

----------------------------------------------------------------
ath.git updates for v6.16-rc2

Fix a handful of both build and stability issues across multiple drivers.

----------------------------------------------------------------
Baochen Qiang (8):
      wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
      wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
      wifi: ath11k: don't wait when there is no vdev started
      wifi: ath11k: move some firmware stats related functions outside of debugfs
      wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
      wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
      wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
      wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850

Caleb Connolly (1):
      ath10k: snoc: fix unbalanced IRQ enable in crash recovery

Jeff Johnson (1):
      wifi: ath12k: Fix hal_reo_cmd_status kernel-doc

Loic Poulain (1):
      wifi: ath10k: Avoid vdev delete timeout when firmware is already down

Miaoqing Pan (1):
      wifi: ath12k: fix uaf in ath12k_core_init()

Rodrigo Gobbi (1):
      wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready

Sebastian Gottschall (1):
      wil6210: fix support for sparrow chipsets

 drivers/net/wireless/ath/ath10k/mac.c        |  33 ++++--
 drivers/net/wireless/ath/ath10k/snoc.c       |   4 +-
 drivers/net/wireless/ath/ath11k/core.c       |  29 +++---
 drivers/net/wireless/ath/ath11k/core.h       |   4 +-
 drivers/net/wireless/ath/ath11k/debugfs.c    | 148 +++------------------------
 drivers/net/wireless/ath/ath11k/debugfs.h    |  10 +-
 drivers/net/wireless/ath/ath11k/mac.c        | 127 +++++++++++++++--------
 drivers/net/wireless/ath/ath11k/mac.h        |   4 +-
 drivers/net/wireless/ath/ath11k/wmi.c        |  49 +++++++--
 drivers/net/wireless/ath/ath12k/core.c       |  10 +-
 drivers/net/wireless/ath/ath12k/hal.h        |   3 +-
 drivers/net/wireless/ath/ath12k/hw.c         |   6 ++
 drivers/net/wireless/ath/ath12k/hw.h         |   2 +
 drivers/net/wireless/ath/ath12k/pci.c        |   6 +-
 drivers/net/wireless/ath/ath12k/pci.h        |   4 +-
 drivers/net/wireless/ath/wil6210/interrupt.c |  26 +++--
 16 files changed, 228 insertions(+), 237 deletions(-)

