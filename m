Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B079D3B7EA
	for <ath12k@archiver.kernel.org>; Mon,  8 Dec 2025 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud7NNLBAJQWMt/PynCDg/O4Z5GATNvwyimSU4/I4np4=; b=BnQsy2SZpE4R2NNl6ybUiiN03L
	rHibDNpENwH6MZ1jWACy4sycpi7WOM3PWAoyHxo71MP6V07xB6+y/Ea7azc0G/tXEwx0xDmUpqQsH
	tvySeJPwD3qQsaCVVdAX0bmRFVmCLdO8n/w5YgR0dfN+KL2tq2dSG3qvJ9H5swTUTViiljToshkvY
	cgAUwPKxn8bkFFJ9JTT+HJL6kfZNNpW1uWebO9bFgYR60ADw8Kiy4Rnv/rq0MglbQ51Csa+47Sue0
	bFsXoJTz6yU4v5N2jjxXmA2DyXyXuV1D8ZpOdRDF674uWe2iZrjAuVsX6OCC2kCjjMVvbb8s8qGWk
	1Zc12XPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSduo-0000000DIER-3EYd;
	Mon, 08 Dec 2025 16:16:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSduj-0000000DIDn-3MIP
	for ath12k@lists.infradead.org;
	Mon, 08 Dec 2025 16:16:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8FVK5K3468450
	for <ath12k@lists.infradead.org>; Mon, 8 Dec 2025 16:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ud7NNLBAJQWMt/PynCDg/O4Z5GATNvwyimSU4/I4np4=; b=A3kHbwKrWTMWOSRh
	jUvtaggQbWLZQqvATFE55y/sf2tko7azdbthNSZxgAJixbol5HaQ087BPy21Npxy
	S+Yjj9Uj7ZF/wi+xxGr+NdiUsi3XaoRdYIthqAkWtHHVFJYQ0hF+auz7EGw3EX3t
	bZpdxghmC+Po0eh8G2mBWoG1KzAgNfrp4JyIMWuTD5SbpoEKKUEcn0vHhhoyz/qu
	1r4jpbohd3VqoGBQTZ3eCckwAVwj5V2rZSww10uGw4ykJphFB74pkAW5Zea2A+i1
	XwVL8yuU2nbXagbxGysKczSKC4UdmZtT6jTK6QfJiC1gPJnMIUNNf8aGH+POJkFH
	yY8CKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awthp9jb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Dec 2025 16:16:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c261fb38so7937185a91.0
        for <ath12k@lists.infradead.org>; Mon, 08 Dec 2025 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765210600; x=1765815400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ud7NNLBAJQWMt/PynCDg/O4Z5GATNvwyimSU4/I4np4=;
        b=Kvs05Xk/CZe6A3pI2Es4ym/fGS7f2auLeFOEpExTZl96PSf/wgPaqjswY5E1SAlPEb
         6G9UnBz7dsTwXVTA07tKPDm/mH2zjLXD8cNQHpHA2vcHVyuCb5q04Pfo8opwq4qA27Ry
         1bEfirPbcj5svEktv5uUnuN6dZ6VQG5ut9O7+qSdosTXbW08lfzMJeTINjA2Irr4j98M
         6XhPuy9cS5IilSKfQUcz+iDM5dKZomNKiO0yxw02xOTndfoNebHYKgmNI+gv5qdHcET9
         hjYAwmadYJrDjWSioiSk9i4QfH8W0pVImpLV5EL71Kf0sEXEkYuNj4W1Sc8ix6L6OGBm
         LryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765210600; x=1765815400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ud7NNLBAJQWMt/PynCDg/O4Z5GATNvwyimSU4/I4np4=;
        b=kNw69MPc7l0wBPEnj5iAqjSFTL6+XUDsA5AhunIYCuCRvACShbF0NzeC87c/1ABpJ1
         /k0c12OzO1L6DX03hlD25HT6AaQWxioov9AeBsZrFcFlA5EA7C0ye5H+t2TrCB0JJsEo
         Y2Qmhkg47wpBYMEUwofjZzHRCCNV1M/f/4mb/7KexGnvUScRkGyhus1hZUsInvkSQPYn
         UwT9iyBiv2d20GZ/VEZg5jg2EKDzc+hqRsuR+7ACxdwENdDxLPQsXgGTgMJRQ9QulhWN
         7mhWewFjOiohzmVxs9f+uYOapxOkw88AXcxrRo4yv2tE34y8rtqX5rCDfqym1wcYNXh3
         kiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG51uY0ikryW/lM3Lxm/LhvaF74eIOCCkY5WorFao/VcoO/jXvHigW9LMG6j356OrUcDNFvM0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtVd9uFc2Y+A0i2kyPq6deBo1AIaRt0LsHaTnyYaV8RgcKycf/
	OADdTzWTZN080egnHaYUHj9IysxDpXFekVfFaFVRtPCT5yOCVMspgVBMSD2qfoLaF1IhfXQURHK
	WaInCX5zOKWVl6n/7D2tFQxTFkhz6XOvKOxutVLMhLyia8A0K9eFnD1tKHvueBofBtvXbn8Uq
X-Gm-Gg: ASbGnctcJjIOyl9okgV6/DQNIhDae+HMJqmI+1sxJEgR8td0bnpBfFbi8HOFcIoHUnn
	DF5F309y1QGkx4MxQTjcHnhXxjIN5xEzZOuc230iYWrZbaR0zltkCoXv5psvqDY5su/DPrl0fHp
	5kXk1nt0KvFcKxJ6dM5uRE1LU0fXgz9yrFEZZMFqL6D/SYf4E7nm9WOQDsLS2MQqIRgDSVhdsC+
	G0fykUl6RqneMGHMcclvTT1Q7G0aN3paf80sdGRlH2G2Z1hlWbSc8nKHK9dTGUTE4HIZLQeC4vP
	tXaWf9GUpSaLHnP+szeOhb8qkBpDq0CGaUyFTy1bZ5ecwyH/kFa/dTcu5AYCRC895y213iq599V
	m4XHEpvOx1IPN3Lzy16kd2uPp2EYUM3dIarxiCkFftewyTkMwSQQAGn/Wjl/tXQ==
X-Received: by 2002:a17:90b:562d:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-349a24f21f1mr6514411a91.10.1765210599555;
        Mon, 08 Dec 2025 08:16:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpRBnZEduK9iwcFFoWaJY87xaBpkeyCAnHea2DdIuaFEzyWsnMJduL/ggt7hO7EqfqSSWJTw==
X-Received: by 2002:a17:90b:562d:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-349a24f21f1mr6514395a91.10.1765210599060;
        Mon, 08 Dec 2025 08:16:39 -0800 (PST)
Received: from [192.168.225.142] ([157.49.252.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a23270e5dsm898569a91.4.2025.12.08.08.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:16:38 -0800 (PST)
Message-ID: <c030f82d-75af-9a70-68fb-64c96d7f210e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 21:46:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: Skip DP peer creation for scan
 vdev
Content-Language: en-US
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEzOCBTYWx0ZWRfX3ESPP7JL2HIV
 bFhY5ybjTpKVxDQ1/KLe3bXHbVNes2vOhTqheYqpyYUyM1eW9kx3p53dobtAx0MAOVk6IJARMrk
 SW7269JM30Edck5Rw+NIRrKW3UXOJm8OwHWN2IesSGRydUc0XE66bftKFtNAfKxDtw5/fxuX0S4
 Bdikb/ZOP2vyha6ba5CRnzPaQEPDVrHqXq6M4ch0hWzGqdefqPuaMpkl42lEswB0rs6b3TyCtxD
 Q8dS+A6sbTvgTDV6rcm2FunU56kpC7oBBvejIVHhTxnUJkSjV7GuGOFNAk/B327IVCneDYwaGeD
 AM2LY3jwE9fTlruDMWX140vG5RG5qoXET9YiK3ceHNYnGqIfBRyPN/GXhvf71KSbXL7DJ8mnzaD
 nZuoyGHePQAcewrqiEfCE7P65eC23A==
X-Proofpoint-GUID: 2Q-9hJjzOqSi2YqsCxp2rGFEZyW4UUM4
X-Authority-Analysis: v=2.4 cv=AL1K5/Xh c=1 sm=1 tr=0 ts=6936f9e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=wFAAa1VAB0ePzTpIHxh7fw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bzijrYIIVt2SdmEy8ygA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2Q-9hJjzOqSi2YqsCxp2rGFEZyW4UUM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_081641_850147_D3B051BD 
X-CRM114-Status: GOOD (  12.14  )
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



On 12/7/2025 12:57 PM, Ripan Deuri wrote:
> Consider a multi-link AP configuration:
> 
>      MLD vif (MAC addr: aa:bb)
>          |-- 2.4 GHz link (BSSID: aa:bb)
>          |-- 5 GHz link   (BSSID: cc:dd)
> 
> For AP vdevs, ath12k creates a DP peer using the arvif's BSSID and stores
> it in dp_hw->dp_peers_list. During scan operations, the driver assigns an
> arvif to the scan vdev and uses the vif's MAC address as its BSSID. In
> the above scenario, the scan vdev MAC address (aa:bb) matches the BSSID
> of the 2.4 GHz AP link, causing a duplicate entry in dp_hw->dp_peers_list
> and leading to scan vdev creation failure.
> 
> Failure in vif bringup sequence:
> 1. Create AP vdev for 2.4 GHz link:
>     - Assign arvif with BSSID = aa:bb and link_id = 0.
>     - Create DP peer with address aa:bb and add to dp_hw->dp_peers_list.
> 
> 2. Create scan vdev for 5 GHz link:
>     - Assign arvif with BSSID = aa:bb (same as vif MAC address) and
>       link_id = 15.
>     - Attempt to create another DP peer with address aa:bb.
>     - Operation fails because aa:bb already exists in dp_hw->dp_peers_list,
>       resulting in duplicate entry conflict.
> 
> 3. Delete scan vdev for 5 GHz link.
> 4. Create AP vdev for 5 GHz link.
> 
> Since DP peer is not needed for scan operations, identify scan vdev using
> arvif->link_id >= IEEE80211_MLD_MAX_NUM_LINKS and skip DP peer creation
> and deletion.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

