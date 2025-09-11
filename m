Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9459CA101F
	for <ath12k@archiver.kernel.org>; Thu, 11 Sep 2025 01:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcCH8ZFtJMRB/ZNu25jxmFYingDIGeN/jFSZffgZcb0=; b=iDrL6wQTt0PSfVafLHDHXkbhKJ
	pftztaU6+E8qal2u9d63Bz/rJ2/oAvrEeCy/KwFAlFsJMDmEwAau3je18U96vMX5sCmpJ9oV4x21w
	9gHQsajXslLZej7T1KMqHt8QmRIl2DA/rUjeBGmo/xdnmLgAkf0vSp4ugpPZFkFAIPCsWK97JP8cL
	+y/5n6GWgyV+PGaxxhwlN6VNRaaPGJOzQDJkIhJtjohRvy/wU47b8UGFWzl/7xUYpo9CxHFheCzJ8
	+M1Qbpwl9JsuAHYdPqqykqMeJKeI3NOGN8hpn+eRmWunGJ3IleYAjrAJj5LTfj2YB7zzYcFZHkLhv
	bRG4Zm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWTq-00000000FZM-2Onu;
	Thu, 11 Sep 2025 01:52:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWTo-00000000FXm-19eA
	for ath12k@lists.infradead.org;
	Thu, 11 Sep 2025 01:52:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B1hh0D031998
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 01:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcCH8ZFtJMRB/ZNu25jxmFYingDIGeN/jFSZffgZcb0=; b=UEYAt3ZEaGjC0aJa
	kc44RMQ1R9Ns2ZJCbqX6EHPl6/LAW3XcqCLhu2DgSDXd9xkR3ePjI+6taRIB7Fqe
	cdMFjKCprEFQEmSMTxZqmRT5uQwTRjUy6kZwT2iK3Ss1lavbHLQ0slsDUTW+enpw
	3sI3CmgbQj3g5MVAqaJe2dlaGKGNICQYMpukj3XpPpitxaPzw7RYX2t7NxzE4lkc
	JaqQHcj/WUw4Cg03XNhRtXnWB7x9Vh+136OUPuORHno9zutOSwkV4X6FCuSkQZXj
	BLJ6zln3TjA9CRE83GUyLjbo7StECACKdfWXVCMpDpoblI/wvuk9pBO90o8q6CmW
	A/GVTw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwse0wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 01:52:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724bca103dso214876b3a.3
        for <ath12k@lists.infradead.org>; Wed, 10 Sep 2025 18:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757555526; x=1758160326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcCH8ZFtJMRB/ZNu25jxmFYingDIGeN/jFSZffgZcb0=;
        b=Nnoq1MF0YzsVCOXV2q0bPCL4SDOC5aL/poZvIPlf0oSfgV7qCkj05ksgrLQrJBDovw
         kv8KnnG1sifNuawTocBS1WmBUFACG69ogGcX5fZa3qIzq1KAIZFEAujNBGdoEASFWhoH
         G/+8i8d5Mnv8HCcFAOJNzvevaN0G8so9uLcObZgrMo7BPW6GUaYzLm/M53yct111ZplD
         q1Bo2FD/NJVv5+l2U9QNImn/YRRiUHLctuJGLLI2sL19jXyG+uZ+LLo8kPmGnM73p+u7
         er3ivg+AATqhNr3HFOsIp/1+6fOef7zqjf9lLhH6WNQxDOaTeSz5REA1tRSa3IxiU/jx
         tCYg==
X-Forwarded-Encrypted: i=1; AJvYcCXyQLn+RsAbh1gcvJjmtRsTuil74bjLlPgeWhnb04iGfy3GV1IrxqQJsQVUyjvT3bzhykzS06A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzC9AJWvfbVs3q4hgr+bWQhE7WOWKkIFKxeu6dd4DCmtSjVjSSg
	FrMg1Z65DwKIACWtnFPU52tCDVsZBR0/ZarCRtgnkqZkwu64D49h5YAVqExWtjQRjJRPXplGyGr
	KNohVdQyvq0hWT21fp1/jrNJnvDB2b7l1oOhFEOK0W5DxbqvmCLqlPqqV4G65LE71
X-Gm-Gg: ASbGncvkoAvwVoB2RktYS/6OT8o/Tofvu3WgJXKLI/d+fqflZHcMfpqLfhdIUNoSOkq
	J/RjGiFTvlEzS1fzEs454RT6LxSs6vSF1yizi7fiADxfTS2W2Lu/O5XyJT7FrpNeHBZlao058rI
	GtZpa5S0b5z8b619enDTS2I0h6jZyVLv/mwWKEZQd+e61yH7RJNY2C6Nhq4i6DAQSVenw4xdd9E
	Lieq675SWf0MJBO15woK6xOdxE2Nec8K/GOXU0pPAI9FsCSliTOqUjapHOUUjx0HNN4GCVEl2LL
	mpmH4YkzzIUuL5ZlPVM3WFoBpZsCpAtLgTgRa03sPCt2MThqMgxrMbFYqR3lJB40i9FsP5r9PkI
	NxQRTDaFb20YVlElekv5cbjCLm8GTaLJfgacXdw==
X-Received: by 2002:a05:6a00:18a0:b0:772:8dd7:f55f with SMTP id d2e1a72fcca58-7742de3fc5amr22247970b3a.25.1757555525785;
        Wed, 10 Sep 2025 18:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0sxY7aOgILMDdCsSOiqoLkHnh7icX8tiTp5J9HTZFVHeKmZ8n2U0m9CT1HcGEi6OdXTMh4w==
X-Received: by 2002:a05:6a00:18a0:b0:772:8dd7:f55f with SMTP id d2e1a72fcca58-7742de3fc5amr22247949b3a.25.1757555525271;
        Wed, 10 Sep 2025 18:52:05 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a4746dsm223331b3a.29.2025.09.10.18.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 18:52:04 -0700 (PDT)
Message-ID: <2522a3bf-e56f-4fc7-ac42-d0abf9908418@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 09:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng v2 0/8] wifi: ath12k: Improve hal APIs usage in
 rx path
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9hrdjsdM3rhF6wWOImhpYDr0SLNM0u-_
X-Proofpoint-GUID: 9hrdjsdM3rhF6wWOImhpYDr0SLNM0u-_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwh93EfAeNviV
 0PPvdmUPFFxIuDm9cyUEPLLzzjjL0Cb3+ogfEmOIztSAXNbXiB8YhbAl8vdTp69vpjugV+Nt1Bc
 U6/ROYdzLzRpJ1MiuzwAtMP611E8knLdY8wnLKzMA74xg6h7cLvmqWz5mLLXndCdJ5H2glbM8QX
 FjJQKjkTKYSLdtD1fciutOMS+3q83HRsLRa7SFqP6cRC8itOYr+B+L5IYY8WnQdQBN6vt8np//Y
 3QEX5rWX+x7uOW5ySjnvgVg9HlaPZG+aOYfHrBCt5Ss5RycgWY8rdLpn2OR4bu0IfR6t80zdVjh
 ZN92m2WGG1YAcYqpcdM8CkfV7k5io4rm8dQMIgNI0m5/zZ7WG3e1NQ2wP3eVQQvN7Fzsh6oeugJ
 AAtArLK8
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c22b46 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nnDDZHBImGbq5RFmGnAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_185208_332604_7A0CF3A1 
X-CRM114-Status: GOOD (  16.81  )
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



On 9/11/2025 2:14 AM, Ripan Deuri wrote:
> The existing usage of rx_ops to reach the hal_apis at multiple places uses
> function pointer indirections. In order to avoid such multiple function
> pointer indirection, extract the required hal parameters in the rx path
> right at the beginning and store them in a structure which is then
> leveraged by the rest of the rx path.
> 
> Move remaining rx_ops APIs to hal_ops to simplify hal API usage.
> 
> Also, make compact tlvs as default mode and remove the non-compact tlvs
> as they are unused. Since there is no need to maintain multiple versions
> of tlv extraction APIs, move the rx_ops callbacks to hal_ops.
> 
> ----
> Changes in v2:
>      - Update commit messages in patch 1/8 and 7/8
> ----
> 
> Pavankumar Nandeshwar (5):
>   wifi: ath12k: Remove non-compact TLV support from QCN
>   wifi: ath12k: Replace ops with direct calls for rxdma ring mask
>   wifi: ath12k: Move hal_rx_ops callbacks to hal_ops
>   wifi: ath12k: Add new infra for the rx path
>   wifi: ath12k: Change the API prefixes to ath12k_wifi7 in tx/rx
> 
> Ripan Deuri (3):
>   wifi: ath12k: Move the hal APIs to hardware specific files
>   wifi: ath12k: unify HAL ops naming across chips
>   wifi: ath12k: Remove hal_rx_ops and merge into hal_ops
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |    4 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |    2 +-
>  drivers/net/wireless/ath/ath12k/core.c        |    2 +-
>  drivers/net/wireless/ath/ath12k/core.h        |    2 -
>  drivers/net/wireless/ath/ath12k/dbring.c      |    5 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |   31 +-
>  drivers/net/wireless/ath/ath12k/dp.h          |    1 -
>  drivers/net/wireless/ath/ath12k/dp_mon.c      |   36 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  128 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |  204 +---
>  drivers/net/wireless/ath/ath12k/hal.c         | 1048 +----------------
>  drivers/net/wireless/ath/ath12k/hal.h         |  106 +-
>  drivers/net/wireless/ath/ath12k/mac.c         |    6 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |    2 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c    |   19 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.h    |    5 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  501 ++++----
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   74 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |   49 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |    8 +-
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  369 ++++++
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.h   |   35 +
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  161 +--
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   82 +-
>  .../wireless/ath/ath12k/wifi7/hal_rx_desc.h   |    7 -
>  .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   13 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |   18 +-
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  364 ++++++
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.h   |   32 +
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c   |    2 -
>  30 files changed, 1452 insertions(+), 1864 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
> 
> 
> base-commit: d637c58a29475d646f8decfbbc1d27fae999a449

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


