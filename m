Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449C2C369BD
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NEhBSuCetn4PpXRAudTHnTLsBzszyTgEzoewnXblsPQ=; b=hwujQFUTw80DrCv7HdENjL6YbE
	7EpRHCwFECehGMDy4uQK9XUHYwsyVn+27cK406Ngbo9uMbD83iylNUQipUi4x77MLVtkQa/efvtWD
	zRGUAQjO1HGXH7XclkArd2cFthLnNZvgjDldrQljHuZGB6MUPwoU822fYiQ4/qYk5Vi+mUsRhnxOb
	vY4sDvginCA9A6GX/QIjZRVp1nuaJ0zcdeScouJf07qbAQkxf1hpdVM3cxZwqZDaq56zlN486X5rx
	Mty/izmBymG+PRfwBmpgIAobMUHFRsl4e64FPfSVXLuY57Bu4NBZiEW4/UVxMfMn+ub8JwZbCNfnO
	+GQS1/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54qV-0000000A6kA-3yc7;
	Wed, 16 Apr 2025 15:38:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Ty-0000000A2Xq-25In
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 15:15:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mhdZ022364
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 15:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NEhBSuCetn4PpXRAudTHnT
	LsBzszyTgEzoewnXblsPQ=; b=A4mOAH6HIqzrgDeO+/5YOXXJw/GaTW38+2Jj45
	/kkgkKpFtmxJLsYs47GElOpUTylBH4l5ZypTs4Yu1FCbi+8AMqqBvqDD/Dul+Gos
	LezNbY5x6xastyAjkBtMdvP2Z13GecOwxhnIR30xbr+MOLuXu+QzeAUw9qBKrqbg
	5WXmDPulVJAD5XpOyty7wEzQtxVvYYsO5aY9PpTEKAnx/0Zh691WzD7CUWs6efeJ
	gN+r/yGG7Cge1nrm/wtvXdOwLK9Q7LnbJ3dWnNQgGlNCKnk6RFNVckeXNaJ8mBTq
	zktO/CwQz0jg11tRErCj010bPf+rmnGfHt0t9e6LBKX2awRw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9bwr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 15:15:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af9b25da540so4146147a12.2
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 08:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816519; x=1745421319;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEhBSuCetn4PpXRAudTHnTLsBzszyTgEzoewnXblsPQ=;
        b=uhb/ITmhMTXXVHZVgoKJKpiMSrwA5Q0xQax0imUnwfM2VJul+J/Ked8SsADl+tryfs
         ckOQnZ/2iFYQI0/3NaALuMM4Q+shmpLvdxM878S4Y8O/1TV3F4KH4ZmJ3G4Cz9mxS1o4
         0wCldF2ttdCKAjjUvxyNuvqZt4WbANfgJsXaEFyaMKxEYgQ9JpI2VeWEBD6gvvgjrTMP
         qjBxaZAEAHgBnOgtZ6o1//Dlc3L+d4NcktugvLkSsTf57jpYBU6c0Lrb0JOL1tZWnbcY
         ep8HUij26U3Rmv3TP3z0xBjwh6Q3WbUBpK4Itf2h8GDGdEWQo07H8KXGOwb8EwwXA+w5
         NCEw==
X-Gm-Message-State: AOJu0YzrkdCSPjDE+GslnRwjR21iv0ouQyBKhi9kI+kPkHD5AKLJ5h5/
	w6RLlc7KrW9UfWOr30g5O9GFhpq0F1E7IAI/fhnl+YsO+JGytKrdtIpxcGLeNj5eKW+bSSIJmd0
	ZXIauu3oRE7TpOb0k6g+p0TTlyDKRje5hjNAnHJe5yItPIcLZekgpTRzInmt4T5KeBwn8
X-Gm-Gg: ASbGncvZqsfW/+SBsZ33bW3gBNyBkX5SpqMoE4/6IwB+dp+tbnHxmBr1ueMzfnX2WR9
	9+yz/9uu9ppxzBKM6a1ykfXvzRL6MJtoWRyTfu9W9dcU9U/PDiRud/RtO8wsTSjDs6UT5lGAbWG
	TJxYLDwHn/itfpHvVaiJxAHS3vNDGFDdGnQkLUrQbdQr3YcRMpbJTjTM0mS9ToFQCpqMS06XyM4
	8AilBXEpKqIJPJTT7bcD9+fHfyqbCDVTJJiv4NUuVyoT1xP5nRyJWyfStWp8HWaKHeRWZih7Gox
	qaEjB9HAQBcwunnyzoTh19E0psGkQtLEOGpzokT8ZmLwRg+5NxHeLxij+q4cDn4aBE4=
X-Received: by 2002:a17:902:ea09:b0:220:fe51:1aab with SMTP id d9443c01a7336-22c35973de0mr38489995ad.38.1744816518668;
        Wed, 16 Apr 2025 08:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLflvYcPX9udFhVxx50Dt6Iu3IeOXMZRNKqZJZvjXtz5qg7c3QiY2p147/LQKbzuhEDeHOaw==
X-Received: by 2002:a17:902:ea09:b0:220:fe51:1aab with SMTP id d9443c01a7336-22c35973de0mr38489285ad.38.1744816517821;
        Wed, 16 Apr 2025 08:15:17 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d091sm15352045ad.61.2025.04.16.08.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:15:17 -0700 (PDT)
Message-ID: <4a17d730-ede8-463e-98d8-9b0291d0ca45@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 08:15:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        linux-wireless <linux-wireless@vger.kernel.org>
Subject: RFC: Proposed modularization of ath12k
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lbqxsjFQZXco0XRc2eY-4p7gM-J0dAe3
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ffc988 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=BeYPPTR7LseZEc40eHkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: lbqxsjFQZXco0XRc2eY-4p7gM-J0dAe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_081522_723170_0DC482D8 
X-CRM114-Status: GOOD (  17.01  )
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

BACKGROUND

Historically, for each generation of Qualcomm Atheros Wi-Fi chipset, there has
been a separate driver, the most recent being ath10k for 802.11ac (Wi-Fi 5),
ath11k for 802.11ax (Wi-Fi 6/6E), and ath12k for 802.11be (Wi-Fi 7). But there
is common functionality and code across these drivers due to firmware and
hardware architecture leverage across generations.

In the existing development model, code leverage is achieved via code
duplication. When a new driver is created from the prior driver, it is first
stripped down to basic features to allow for easier public review, and then,
over time, features are added back to bring the new driver up to parity with
the previous generation driver. So there is a period where existing
functionality in the previous driver is not present in the new driver. In
addition, introduction of new functionality requires porting across the
different generations of drivers.

We are now looking ahead at how to support 802.11bn (Wi-Fi 8). And within
Qualcomm there is consensus that the old way is not the best way forward.
Therefore we are seeking feedback on the following.

PROPOSAL

For better leverage, refactor ath12k into common and generation-specific
modules. The common module will contain the logic that is shared across
multiple architectures, and the generation-specific modules will contain the
logic that is specific for that generation (and specific to the chipsets
supporting that generation). Hence there will be one driver that supports
Wi-Fi 7, Wi-Fi 8, and hopefully all future generations of Wi-Fi. Previous
drivers (ath11k, ath10k, etc) are unchanged.

Firmware interface, core initialization and de-initialization sequences are
usually common across different device families. Hardware register
definitions, Copy engine mappings, MHI config, WMI resource config and
hardware abstractions are usually generation-specific.

Common components includes following
      mac80211 interface: Control path ops are mostly common across different
      generations. Handlers will be shared as much as possible.

      Firmware interface (WMI, HTT, HTC, QMI): Firmware interfacing messages
      and sequence is common and kept backward/forward compatible using TLVs.

      Common Datapath flow: Buffer replenish, Processing of RAW packets,
      delivering frames to mac80211 and similar common path not dependent on
      hardware TLVs and registers.

      core init sequences, reset sequence & recovery sequence in shared code.

Generation specific code includes.
      Some mac80211 handlers that are very close to device like tx will be
      moved to generation specific components.

      Hardware configs: Hardware capabilities, configs, MHI configuration, WMI
      resource configuration, HAL and other architecture specific code.

      Data path flow: specific to hardware and TLV integrations like,
      processing of RX and TX flow that involves hardware register and TLV
      interactions.

It is proposed that ath12k.ko will be the common module. It is proposed that
ath12k_wifi7.ko will be the generation-specific module for Wi-Fi 7 devices.

The current ath12k.ko will be refactored as depicted below.

                                        +-----------------+
                                        |                 |
                                        |   ath12k.ko     |
                                        |    (common)     |
      +---------------+                 |                 |
      |               |                 +-----------------+
      |   ath12k.ko   | ===========>
      |               |                 +------------------+
      +---------------+                 |                  |
                                        | ath12k_wifi7.ko  |
                                        | (wifi7 family)   |
                                        |                  |
                                        +------------------+

Going forward, wifi8 can be added as a new module including all device
specific code and new common functionalities will be added in common ath12k.ko
that can be leveraged. It will look something like below

                    +-----------------+
                    |                 |
                    |   ath12k.ko     |
                    |    (common)     |
                    |                 |
                    +-----------------+

    +------------------+           +------------------+
    |                  |           |                  |
    | ath12k_wifi7.ko  |           | ath12k_wifi8.ko  |
    | (wifi7 family)   |           | (wifi8 family)   |
    |                  |           |                  |
    +------------------+           +------------------+


Proposed directory structure
Existing                            New
.                                   .
├── acpi.c                          ├── acpi.c
├── acpi.h                          ├── acpi.h
├── ce.c                            ├── ce.c
├── ce.h                            ├── ce.h
├── core.c                          ├── core.c
├── coredump.c                      ├── coredump.c
├── coredump.h                      ├── coredump.h
├── core.h                          ├── core.h
├── dbring.c                        ├── dbring.c
├── dbring.h                        ├── dbring.h
├── debug.c                         ├── debug.c
├── debugfs.c                       ├── debugfs.c
├── debugfs.h                       ├── debugfs.h
├── debugfs_htt_stats.c             ├── debugfs_htt_stats.c
├── debugfs_htt_stats.h             ├── debugfs_htt_stats.h
├── debugfs_sta.c                   ├── debugfs_sta.c
├── debugfs_sta.h                   ├── debugfs_sta.h
├── debug.h                         ├── debug.h
├── dp.c                            ├── dp.c
├── dp.h                            ├── dp_cmn.h
├── dp_mon.c                        ├── dp.h
├── dp_mon.h                        ├── dp_htt.c
├── dp_rx.c                         ├── dp_htt.h
├── dp_rx.h                         ├── dp_mon.c
├── dp_tx.c                         ├── dp_mon.h
├── dp_tx.h                         ├── dp_peer.c
├── fw.c                            ├── dp_peer.h
├── fw.h                            ├── dp_rx.c
├── hal.c                           ├── dp_rx.h
├── hal_desc.h                      ├── dp_tx.c
├── hal.h                           ├── dp_tx.h
├── hal_rx.c                        ├── fw.c
├── hal_rx.h                        ├── fw.h
├── hal_tx.c                        ├── hal.c
├── hal_tx.h                        ├── hal.h
├── hif.h                           ├── hif.h
├── htc.c                           ├── htc.c
├── htc.h                           ├── htc.h
├── hw.c                            ├── hw.h
├── hw.h                            ├── Kconfig
├── Kconfig                         ├── mac.c
├── mac.c                           ├── mac.h
├── mac.h                           ├── Makefile
├── Makefile                        ├── mhi.c
├── mhi.c                           ├── mhi.h
├── mhi.h                           ├── p2p.c
├── p2p.c                           ├── p2p.h
├── p2p.h                           ├── pci.c
├── pci.c                           ├── pci.h
├── pci.h                           ├── peer.c
├── peer.c                          ├── peer.h
├── peer.h                          ├── qmi.c
├── qmi.c                           ├── qmi.h
├── qmi.h                           ├── reg.c
├── reg.c                           ├── reg.h
├── reg.h                           ├── testmode.c
├── rx_desc.h                       ├── testmode.h
├── testmode.c                      ├── trace.c
├── testmode.h                      ├── trace.h
├── trace.c                         ├── wmi.c
├── trace.h                         ├── wmi.h
├── wmi.c                           ├── wow.c
├── wmi.h                           ├── wow.h
├── wow.c                           +── wifi7
+── wow.h                               ├── dp.c
                                        ├── dp.h
                                        ├── dp_rx.c
                                        ├── dp_rx.h
                                        ├── dp_tx.c
                                        ├── dp_tx.h
                                        ├── hal.c
                                        ├── hal_desc.h
                                        ├── hal.h
                                        ├── hal_qcn9274.c
                                        ├── hal_qcn9274.h
                                        ├── hal_rx.c
                                        ├── hal_rx_desc.h
                                        ├── hal_rx.h
                                        ├── hal_tx.c
                                        ├── hal_tx.h
                                        ├── hal_wcn7850.c
                                        ├── hal_wcn7850.h
                                        ├── hw.c
                                        ├── hw.h
                                        ├── Makefile
                                        ├── mhi.c
                                        ├── pci.c
                                        ├── wmi.c
                                        └── wmi.h

A proof-of-concept is already being developed in parallel with the current
ath12k development in the ath12k-ng (Next Generation) branch in our public
ath.git. In order to not interfere with the review of current ath12k
development, we will not be posting ath12k-ng patches on the mailing lists.
However, it will be easy to tell when new patches have been pushed to the
branch since the Intel 0-DAY CI Kernel Test Service will run on this branch
and publish the test result to the ath12k list.

Public branch:
https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-ng

First Intel 0-DAY build result:
https://lore.kernel.org/all/202503300031.2IK6j4IS-lkp@intel.com/

Public comment on this proposal are welcomed.

/jeff

