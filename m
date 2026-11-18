Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC7A606A336
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=depEGu8/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AwPg9e9p;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E062KLWI;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QIiGDzJn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=depEGu8/KAe1vY
	82J2nHZ4WDEMdQXGAV42PadhgiW3mMEpW4bv6wYBMET2B8/bPPYlrTBL6eOHjs6rC+WwHHiAYF1YG
	ZUgjdE/TY3RQ2RBkeCBhwWei6zQWHQ0perwzIqMYL2eTbiKYqpvl3JH7qAmeKnXpyY1Ngwi16qizV
	w6nSqpogGQeq3JvqqwQURhlwrBIj1LIk/XebkdYcsulQUl28smNPC4acHMEsfChVGAxfIFr/2CSjI
	H+V+5zjBRkbssIghrVnIdsHxGe9eJChhT8IqsvLDfgdCoV1gEZreYAM3+1WGtD8B+g8kO0Iysi77H
	gpOLaxDayUAtNoh/O4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqK-000000088fL-0jmL;
	Wed, 18 Nov 2026 08:16:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqI-000000088b3-1JKS
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=AwPg9e9p7sBGTZaPY4IKEHHC/T
	OPbecS8O3KeJND+Huv/Ba//sgDC/fgfu4ixr6hWJFXFdPpdaz7a2vABO9R8y+KJOXQxwUxW/MQMDF
	BpEECaaX6VCCpLxDXYTVzSjKGgHK7482QOaP+LzZbDc3mteW/P8jjzcc87B7MLbhnDLKcJ+K0haDc
	aVxYMp36gxhJ2weX9j+w+eqJzlIaQcPYK6kS5a8tGUACXntLZHrosFjQbaA9H/ee9oWuBZKYURxj4
	uK2QwCnniVJblhTC+RTCyOqQr4tukR5nfl31Xd27yi/Z3rZeDG9N6uLCVkLtXZPybApnlm9ogTgTC
	tBAMLQng==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqE-0000000FmNL-3Cx0
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VAIP1430782
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=E062KLWIE7vf8KJc
	8AXOA8YTofeLmze+XEj8E5JSdBXBhrpBdHVINxQX049RZ6KoocV0N/TZyeHIl+pf
	le2RfPQ3Frx7u07XbAjUkWDboU/aJ0V1NMHF+qX+uICOTB80H1n0Mj/y5k/9epjN
	2Og29Udz5x/Cxu3o8tXeqL/0BME3S5b6enOYd4G6eEzrnvOqB8+f/yjJMsXBO+q4
	XcaZzTYIF6mj/mp8h8fMZNX4ptuETpCbv2gbgTLM6m/fT5i4KnKaanpBsJy7YpKJ
	bw4a4DGZmQ7sLV/oDwkKTZUw6CmlFGm8bXsB4o2edgaA5BWmcy91qMDJl+I5TBl3
	QWCBDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91yy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso949543a91.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989779; x=1795594579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=QIiGDzJnKzYLYCNQS8WwW8H9xUFHAHm7e8nAJSLvgAadq/ufk/Pohnf9wdDdjghCQF
         0JtpuHoS2j3J7u1+WUvSJhs4Wd3hcW0zWCz/IdrDrW/VnGTrL5Wdxs2Ig/cKmfBamXv/
         y9I9BxhDzeWH3rfsel6ddqLPu++c0CCI/O7P9p6rn8U5ul/264+5WLwuLUxzlBmmbroE
         3P4vOwi3M0uRgrC13dgLZGVZhL+zQpZR6Lm9T+dnRNxKr+tZEuQdwAdclV0uVX/oczH+
         FmrOqJAOwhNbC4efv5bSvI4FAxhinwxnVcgI8nhAMryPa/7XSmWgGzm8ywRvtM8hyz2W
         v8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989779; x=1795594579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=kbhB8XeaKv90ZnuszX3WM2l4sqmW/i2LF0GS/9ayo44+g/bhJ/Ki5E45XWQ5nemC1y
         lgpoCCtHQm53r5qEJPLO6fSbEIEGh3Bf5lLNliwdR0tBFtzbeKomMnluD1vkcXv4vMuz
         96Ez7OlwyzWa14pnHhOekq65q5B60EKdhXld8tXHcAiunzgzUHkaYl/jwDvmZ8dV/0Fb
         TFGLbKExIZ7COQ1Ibnl93exPPjbA0ybgQFZho3U3bfY5S+3exn9zBoGpdVbB3THCH0QK
         8ByN4/cWfma5GjwemBIOH57OtvFebB5DmB/DIaHH6acSF7fmObD66VM+sApVVd4M2l5g
         C4UA==
X-Forwarded-Encrypted: i=1; AL+hErFDAKNn433NCKV1kEJ5epfR0pzFcdZzxE8GK+rRseaFA8meuJu5kk3DQTjKhtrCR964M0ryRWM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9gUl1yhrb5MCVAS71rzp5WyKSNgxlzUIS04cpg9PfExhf6YVeE
	WzyJVHJaeR4/vSrMd4eO+QEWJ6CNhGfEitvihr1tLldY+YAb958/0s0tVDGUuj8xiXnGkCQnH8f
	67An2/wsd9nsbazZLowo9/1tGs4IC+EiG0rvMSpn7a5zuS8arEyQ6L70MFHNSjj8AUGfpBgx+
X-Gm-Gg: AZFdTZe2u1c54hZGpfVGxIuYPcP01uvMjC8BFmMgOiCJpurb3m5JrloC0OiQR8v9qU6
	p46akvg1Z8+DLNaU9z7opg5BVz7viowm/qLribdDwOhnTpjIl23a+g2yRJ2tUDu00riz4NBGzN7
	9q0eJV0rrG0dhe6aFDOPxrUpjaNTB7siYWI4ycEN8p69R+UkO2BZu6W4lhX955NlYPbNwo3I9px
	srmDNI/zYZ28/fv8JQQDXiqhVFK3psOXXDKS17S68lVigsBlfQuQ/iBkBbcK32sH0EgIqSWeNWl
	UnbINZw5nTo7PeFdZxMXKRZ0BbsatwMlc4DRPZurSH7p3OLhMXGkeIUdpbQs8wK8sXp467iheXA
	aRU22UYNx/uTQAhHC1yqgnQvRWaTviubRkD0NdxZYX83GLfFiYprhoB1l5KquQBI2ki0lHUrkrj
	KPmLudJGj3XOO+pMaETJx8fhIilmGHpmITokLSfxIkeKOC6JpiJzl5keoOuucvvrGgVeOHNBSlt
	Q==
X-Received: by 2002:a17:90a:e7c1:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b3d07e0c97mr2148668a91.54.1794989778684;
        Wed, 18 Nov 2026 00:16:18 -0800 (PST)
X-Received: by 2002:a17:90a:e7c1:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b3d07e0c97mr2148643a91.54.1794989778240;
        Wed, 18 Nov 2026 00:16:18 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:32 +0530
Subject: [PATCH ath-next v3 09/15] wifi: ath12k: add unified firmware image
 support for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-9-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX/SzX6wKjXito
 t9ANEck5LNCRrNyOt1w/m+sHIAM0kLF9bNZmAzM3GlBDCzcPLbJYS81ZHA8rIBYdPf+pmFea/cQ
 ZhYHiqpKKUe5Dag373SZNs8CEa0W1ypixv9edXg81FcVdF8RoRN/L4CgdkLNZHYbjv2nQABXNH0
 eDU2tjPLmk6IdlrouxtyPemJYFjvt6hmoFwuvYn/HL2+w6hwuvEd/e52jaItqCUleObvU/QS555
 T44EUFQHMMiGM6uUkHFmURn/NV1hdYeu6M3JlhUezJokobmom0zPgsYMkflBvxMUmGXYcyJUqhm
 /4ny/dp5vk0mY/BkpX8cMG7MTb2moPZbsEAxhRw2afICB6Xc91bUKbNQRbJDiPBWnGaJtNgUqf1
 fd2IkWndK9zz2vYkRwSx9T4Xj2JVQba8WPuWqLmjShCyS2AdCfWONc3GNAOyIYdiuj4nMjiuh7+
 MtDUk5dKzsUe8477EJw==
X-Proofpoint-GUID: 4KNEmGDiQ6zxQnLVNJ6poK_OARhUX0p7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX3B+kw/fwydfC
 QqGcLokKokODUYGilVGLgBCxVW+Gw/GSfkkuccCoORkRCO3dD18CanCU2W/uVmzWjq097hU+1Rx
 CYZlz1trOTQn8jSgW/GkFbaNIpSW8hk=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd5ed3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yptJjfQlWYdCmDOAxUgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4KNEmGDiQ6zxQnLVNJ6poK_OARhUX0p7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081631_340274_2B68E326 
X-CRM114-Status: GOOD (  26.23  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wi-Fi 7 chips select between single-mac and dualmac firmware images
based on the OTP board ID, loading a separate firmware-N.bin for
dualmac boards. QCN9575 (Wi-Fi 8) instead ships a single unified
firmware image for all board variants and expects the host to write
the OTP board ID into a PCIe local scratch register so firmware can
determine the board configuration itself at boot.

Add the unified_fw_image flag to ath12k_hw_params.fw and set it to
false for all existing Wi-Fi 7 hw_params entries, with QCN9575 as the
only chip enabling it. In ath12k_mhi_register(), once the OTP board
id is read, stash it in ab_pci->unified_fw_board_id for unified-image
chips instead of running the dualmac firmware-selection path, since a
single firmware blob is used regardless of board id.

Add unified_fw_board_id_reg to ath12k_hw_regs and populate it for
qcn9575_regs with the PCIe local scratch register address, keeping
the register layout per-chip and self-contained. Introduce
ath12k_pci_update_unified_fw_board_id() to write the cached board id
into that register and read it back, since iowrite32()/ioread32()
give no other way to detect a failed write. Call it from
ath12k_pci_power_up() before MHI start for unified-image chips, and
return -EIO on a readback mismatch so ath12k_pci_power_up() aborts
before starting MHI and firmware. Continuing after a mismatch would
let firmware boot with whatever stale or incorrect value is already
in the register and self-configure for the wrong board silently,
with no symptom beyond a warning in the kernel log.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h              |  1 +
 drivers/net/wireless/ath/ath12k/hw.h               |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c              |  4 ++-
 drivers/net/wireless/ath/ath12k/pci.c              | 31 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/pci.h              |  3 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  7 +++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  1 +
 8 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4b0fbd6f4aea..9e88bdf4a93b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1219,6 +1219,7 @@ struct ath12k_hw_regs {
 	u32 gcc_gcc_pcie_hot_rst;
 
 	u32 qrtr_node_id;
+	u32 unified_fw_board_id_reg;
 };
 
 /* HAL context to be used to access SRNG APIs (currently used by data path
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 6fd87482425a..9c11edd2b051 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -160,6 +160,7 @@ struct ath12k_hw_params {
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
 		bool download_aux_ucode:1;
+		bool unified_fw_image:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 56e697fbdad5..90b7774ae6e8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "failed to read board id\n");
+		} else if (ab->hw_params->fw.unified_fw_image) {
+			ab_pci->unified_fw_board_id = board_id;
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
@@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		}
 	}
 
-	if (dualmac) {
+	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
 		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
 			/* use MHI firmware file from firmware-N.bin */
 			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6617440954b1..d238603f6075 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -976,6 +976,24 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
+static int ath12k_pci_update_unified_fw_board_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	u32 reg, val;
+
+	reg = PCIE_UNIFIED_FW_BOARD_ID_REG(ab) & WINDOW_RANGE_MASK;
+	ath12k_pci_write32(ab, reg, ab_pci->unified_fw_board_id);
+
+	val = ath12k_pci_read32(ab, reg);
+	if (val != ab_pci->unified_fw_board_id) {
+		ath12k_warn(ab, "unified_fw_board_id readback mismatch: wrote 0x%x, read 0x%x\n",
+			    ab_pci->unified_fw_board_id, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
@@ -1484,16 +1502,27 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
+	if (ab->hw_params->fw.unified_fw_image && ab_pci->unified_fw_board_id) {
+		ret = ath12k_pci_update_unified_fw_board_id(ab);
+		if (ret)
+			goto err_unwind;
+	}
+
 	ret = ath12k_mhi_start(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to start mhi: %d\n", ret);
-		return ret;
+		goto err_unwind;
 	}
 
 	if (ab->static_window_map)
 		ath12k_pci_select_static_window(ab_pci);
 
 	return 0;
+
+err_unwind:
+	ath12k_pci_msi_disable(ab_pci);
+	ath12k_pci_aspm_restore(ab_pci);
+	return ret;
 }
 
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 62b72558c0e2..70952a52a1b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -38,6 +38,8 @@
 #define PCIE_SMLH_REQ_RST_LINK_DOWN		0x2
 #define PCIE_INT_CLEAR_ALL			0xffffffff
 
+#define PCIE_UNIFIED_FW_BOARD_ID_REG(ab) \
+	((ab)->hal.regs->unified_fw_board_id_reg)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(ab) \
 	((ab)->hal.regs->pcie_qserdes_sysclk_en_sel)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL	0x10
@@ -144,6 +146,7 @@ struct ath12k_pci {
 	const struct ath12k_pci_reg_base *reg_base;
 
 	u32 window_reg_addr;
+	u32 unified_fw_board_id;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..282a41980d98 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -413,6 +413,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -509,6 +510,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -607,6 +609,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -702,6 +705,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -792,6 +796,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = true,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -891,6 +896,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -983,6 +989,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
index 076a5a609f8b..92ea24634100 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -68,6 +68,7 @@ const struct ath12k_hw_regs qcn9575_regs = {
 	.gcc_gcc_pcie_hot_rst = 0x1e38438,
 
 	.qrtr_node_id = 0x01e03300,
+	.unified_fw_board_id_reg = 0x1e03304,
 };
 
 static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 91d8f762e642..bffd1081fd2f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -24,6 +24,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = true,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,

-- 
2.34.1


