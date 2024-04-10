Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F30CD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45ZHGLmzCQaKQWRaomwIknmzwGoAcMj+63Euzxd312I=; b=nV7vHCu3Ug1c3yPhxGQLl1Zbfx
	KCItzWuxDZWaDRFkbT3dsqSYP7XiOgB9aRGwhdyo+LXx9HwOrRXveCj0gr6duQ0Ld7p/PeO8/A7Gi
	rntYxez9uf813aFMDtqKtgo42cLA3EMi9XbU7i+S6lWh3MGtyVaC6pZd8nzVEpD56o1YinKhRvQn3
	ChlQXVgykfgVb1ypiKUwBgRjGiiOqltlo9ttSSom3caogB/gJnKWAIO+Or8a2+RWfzpu8lCPgA/7u
	2MvLvSOW76gI8MVgK0C3MgyrwarDVLTEWdHv/hEscQrTYBhUhSOc91Q1gXUJuBTv60cKqRfyEVniE
	qhl00/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rueWF-00000008qPT-1p4e
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 20:26:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rueWB-00000008qNG-1TpT
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 20:26:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJuZIG006694;
	Wed, 10 Apr 2024 20:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=45ZHGLmzCQaKQWRaomwIknmzwGoAcMj+63Euzxd312I=; b=kg
	/seMPZWkvWTwLl9V+PYVVsJmOWgHW9k613LEuOfboSAbUMVEWXNFMbX734abqJc3
	G6pKQfoGNgpw6gtQTTyAzuem+bS3j98dCKSjzPmWZ3ABdp2J2ZkKmxCFA1EJhdJV
	ZNgKw9mzOn2bTIZB3cwMxdOZ1d1AP2ua7G1sqIxcbfjgZZaXP2mcpuR7q1gJO2Bw
	4ndvgVlCU3l8hQ37KlmDO8kTU4Iu96yKS8TYT2bfVcvAbmpBX+vGuKtJ0bMZs482
	Ke4EbjAwiv2YeO9iH++U4SBIHMF7TGh7OQq7QVgz4re7SNSeOVTFro6TtJTxv2fR
	+U5wq/wioVpiMI8n148g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdkv8mgc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:26:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AKQ0UN031299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:26:00 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 13:26:00 -0700
Message-ID: <c5dec609-493a-4246-b006-aa905edfdac3@quicinc.com>
Date: Wed, 10 Apr 2024 13:25:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup
 Failure
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240409190922.4180631-1-quic_nithp@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240409190922.4180631-1-quic_nithp@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NSLLVEXaV6FCj-3SCCtGBa_ssF0fNtt9
X-Proofpoint-GUID: NSLLVEXaV6FCj-3SCCtGBa_ssF0fNtt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_05,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=832 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_132603_551082_5CB90565 
X-CRM114-Status: GOOD (  14.31  )
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

On 4/9/2024 12:09 PM, Nithyanantham Paramasivam wrote:
> We observe intermittent ping failures from the access point (AP) to
> station (STA) in any mode(AP-STA or Mesh) configured. Specifically,
> the transmission completion status is not received at Tx completion
> ring id-4(WBM2SW ring4) for the packets transmitted via TCL DATA
> ring id-3. This prevents freeing up Tx descriptors and leads
> to buffer exhaustion.
> 
> Currently, during initialization of the WBM2SW ring, we are directly
> mapping the ring number to the ring mask to obtain the ring mask
> group index. This approach is causing setup failures for WBM2SW
> ring-4. Similarly, during runtime, when receiving incoming
> transmission completion status, the validation of the ring number by
> mapping the interrupted ring mask. This is resulting in
> validation failure. Thereby preventing entry into the completion
> handler(ath12k_dp_tx_completion_handler()).
> 
> The existing design assumed that the ring numbers would always be
> sequential and could be directly mapped with the ring mask. However,
> this assumption does not hold true for WBM2SW ring-4. Therefore,
> modify the design such that, instead of mapping the ring number,
> the ring ID is mapped with the ring mask.
> 
> According to this design:
> 1. During initialization of the WBM2SW ring, mapping the ring ID
> to the ring mask will ensure obtaining the correct ring mask group
> ID.
> 2. During runtime, validating the interrupted ring mask group ID
> within the transmission completion group is sufficient. This
> approach allows the ring ID to be derived from the interrupted ring
> mask and enables entry into the completion handler.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


