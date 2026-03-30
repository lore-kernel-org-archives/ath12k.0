Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C31061B1F
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j38a35G67aNiYuFO4syzf5Rj5+1OXxDU3StCqGCqLKI=; b=upb+PfSns6kZIP
	OEcOjQ3oNdVdv296GxQJcJbA12oLRy77+xkRDBMmVBKH5eZKE9RYmXt/F2WsqYlL72+2B2GoVwxgo
	1dkNJCPfhBZ2HWu/h0l9I90JezPQnEFAowCOem8V92vjLxxaVizEWuTSmFjxHkKV7MgsgukPixzn8
	/OnQY0wMb2u3RGZ+jidBYONPCr6DRS3+0U6pa3ntp2pISXOWINsTmiVCsTi1jlFwxltYKp+G7dW6P
	ii710KQCgsJTNkygr5I5YrZ/fNGLWXansChmxP8Rs0ZTfgpBOyfUSGItKelnVWGEDJfzp8J4TpvFq
	gZlBSTf7jB/dBkVwoabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JON-0000000BqFT-0hyh;
	Mon, 30 Mar 2026 20:39:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOJ-0000000BqEo-3xEp
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 20:39:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGWggo1403035
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j38a35G67aNiYuFO4syzf5
	Rj5+1OXxDU3StCqGCqLKI=; b=Fv7oSYJ81D81LYlOITs3d988zFkREgiMaolNIg
	RtMbK88VUw2xvp6RmZOMV7zF/mQQA7ibIqXm1XDQW4GhzTlWAw+A4DfXayW4mpIK
	QtRZX4kUvAB6VYbuq0q7OE6p0/OhQCG3XfMXqAcBBmZgIp2oWSsEaMh4hnqtgQAb
	iJ+aB+Rk7BPB8W65WnNonttNwjQikbQt6bdhJnxxWntqbrzCG/4nttziYVpcxdRM
	EwGYIwE1gdj+R2kZlEDPsqastipx91/NxTP4mK5IeHQXoTyMPrPZABdta//eMUB0
	dc2iOZucHmYaFMcbBAW1qC4G20JrXC2rDNd81exNsQ9iau4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4haa26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24e45271cso21340645ad.2
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903156; x=1775507956; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j38a35G67aNiYuFO4syzf5Rj5+1OXxDU3StCqGCqLKI=;
        b=GfZ0B2q523li1+V4OsLjBKBOS1U+esz7IcozHBL1r2XsLoa1zkLYPLhj0rcdiCvELn
         pX2jkOXhXJK4RcXnQD6iQeM6S95NBY0P6UeSPjyVfCwUa8ZiW2xHuq+13AjQt9+MG2Z5
         hGMeuTxOXaRh4F4QL4k1QYh6MOXv4hqlt7UVeaWVtwxatgMFBgzouH5VPU32P4bIyoP4
         WMxcG3KUcTeJUxT//80vX4XGUwAdo/eyO6lXMKQghlSYw82XxUIzpJGuzwt5wvnHhTqY
         ocw7lPfo5B2klUr88AjikEgD24JXAmrKshcxT0Rd19qVrP14IcYrkVKcrkTHKkjcoyub
         yFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903156; x=1775507956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j38a35G67aNiYuFO4syzf5Rj5+1OXxDU3StCqGCqLKI=;
        b=X/lJptdwtHrVYGOLkEkrBF9LcZuTiyqSof2vFpONGQKs1TVUVEmvU3mRKue134JL6K
         B7jc9g5vvOP2QlbPpNdC/4H5VRJDCPj5edALXbid6DpKJvfgIBHm3RZbvNFdTSCKtvJQ
         JL90lxnDAKCPSKBjzjdZ4P2KwNHTZb/Wz7chYHHuPjXGjCWz3qVdKhXba67L6VN9omxy
         vyhJuXR1m0JTzM8oCqsRrjcbxUbq6mMk0RnNLcvrDBMnLkDUy0sX9QKzTYoMPSH1RsT3
         72duTDSLGs/s0TspiGTNI8KwcohvglrkExMPOqrgI6IMl9tX7HhBv6hoTeYwPlMBeah7
         /ZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZKDHmSIlcbyyE3T9ZbbgJ/vgFMb89bFTiAGpFKrOrS2jwNr8a9x/VKtwF/W8ym5GhfJq2phM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFBm3KWf+Wqh3Td6jqhvS7quJJ1j3Xskh83uJG+M5JX87IbppQ
	nrFLTR9Ck14n5D753CxXuhSjLwtqVKM8ipW08prFNar+twJdUy0GZNtA4C8dDCDjgJSop13tJIM
	QRDAMRzD9uo0fhAFpaOkTK+6b8cv0oLC7kO76VFCAMn2PHTHOGBGIR0/ip63quGSR
X-Gm-Gg: ATEYQzz94ZWVDyUX1cRX7w7XWFLqAb4HCfjGh8mGg1AhAhiFACQi5JFvUgxqi0rInmD
	X7GMj1ktiy8/RvOm/mQ0P6H9bOC0Wm6bD37iRN4Zb6MkByzlQ/JIePB64+5N9V4trmKVK0boCAT
	vM+ozjrPPN+d7JuPfyPXwHW7EzYgj3HP1NfPGPG7/QrEky7RFag9QILd+droPjGL+Y2pL7w4KaZ
	OTXZlT2gBu8FL8tzltKLDASJoFBsGsfEXq8WDMNN8x2dW2G0DltsRdfrhkwh2hwh06v30IjWziQ
	GRiHLyItY/vx51EAEopEgrUYiKR5zH1m6q1cY09OMnlTyQJovmt7ZdfsLUWBCe+4nTIgxlxTwfT
	MdharjWwCbEP3RsGOpd9HULNYwtpAg6TtmMd0WV0xSbiTv+4sZbcobGSE5j2uejmC7GNS+zweMW
	/MwfAk9KOr9mRwhmC991VODxQD2ztg3/LJqxMNqkI=
X-Received: by 2002:a17:903:240c:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2b0cdcba093mr134968825ad.37.1774903156257;
        Mon, 30 Mar 2026 13:39:16 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2b0cdcba093mr134968535ad.37.1774903155765;
        Mon, 30 Mar 2026 13:39:15 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:15 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH ath-next v3 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Tue, 31 Mar 2026 02:09:05 +0530
Message-Id: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnfymkC/yWMQQ6CMBREr0Jm7U+grTV6FcOitF/5mlRsqyEh3
 J2Ky5eZ9xZkTsIZl2ZB4q9kecUK+tDAjy7emSRUhmqVbbXuyJWxU0+S6X00ypAPYbDaGevOJ1R
 pSnyTeQ9eUb8UeS7o/0v+DA/25dfDum5aiqeUfAAAAA==
X-Change-ID: 20260331-ath12k-ipq5424-cddb63a46a97
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfXx4otk5WTuDz4
 KPdj+ncBPh2JddK5Yo7ito8WuJQ8N7CBgUs38hfRtQuskHHm4JqpVw/EKCKVUDH7UAO8V3ZN7Iw
 ZUDTUIE0S7l9XIh128rHYnRq4cwa5JRR+VHF2B65RXXECTN3kJh31nrBcOJ5D1PswQLVU4IcOhv
 waC+GkIp8N9hA5BXjFzO56HIQFQoNKb2Bf5bsqby3voqGB5xl5UJU00vr+9/f79eqqIldT3U3i3
 hFCAf/eQyZOyiegimwX3nuy5m5pHG69WfO6YqFKGev59jl5hSZJuu1ITIHx/QIWUGC1VJ5U68Qm
 hNjo6G2CHADSgCyI7lVlmvqh1/avHcUxou08UN97hhRG4jzqH6o1PsoLkdLQXC6ln6eQQ+UHXfq
 Jkw4PfhGvnwCwQk93w3zDtEeqgqyZJ+A5JaTFkJtrkjxMB4cO4IA4yJe77VEXHVXf3VzvGr/rGX
 6qi52tMQWkLISKm4ncA==
X-Proofpoint-ORIG-GUID: sDGwRy9ISpZgnVi8ro7r2JKvHxc0eRL3
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cadf75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gShIAut8tMQcv_q5NMcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sDGwRy9ISpZgnVi8ro7r2JKvHxc0eRL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133920_108086_E24D1592 
X-CRM114-Status: GOOD (  11.77  )
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

Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
AHB only supports IPQ5332 WiFi devices.

The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
configurations. To enable the IPQ5424 device:
- Add the necessary hardware parameters for IPQ5424.
- Modify the boot-up sequence for ath12k AHB to accommodate the
  requirements of the IPQ5424 device.

---
Changes in v3:
- DT binding: updated copyright.
- DT binding: Dropped Acked-by tag as copyright is updated.
- Rebased on latest ToT.
- Dropped ath12k_ahb_ops because qcom_mdt_load() and
  qcom_mdt_load_no_init() now have different number of arguments.
- Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/

Changes in v2:
- DT binding: Removed the redundant example for IPQ5424, as it is similar
  to IPQ5332.
- Added driver probe data structure to eliminate the redundant switch-case
  logic in the ath12k_ahb_probe() function.
- Validation completed, hence changed from RFC to PATCH.
- Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

---
Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  3 +-
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
 11 files changed, 232 insertions(+), 22 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260331-ath12k-ipq5424-cddb63a46a97


