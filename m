Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55CCE7AA5
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 23:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGkirmq6fdULqUsQlJs0l6hHXX5W6RsKQ+g7CB6M+KI=; b=fpJyUVxv/dxJafQ+3+KRnXhkTI
	eQrA4D7ZbbsK8W74nTwnHaA9prhx98PWK/uzKm1dbsCTw9GrUf3+AOZOkPrmjepa1a/bkwBp15M4d
	wv8r+CsPDC+Hrsbpu+X0fG2A686DnliLugt3mmyfKHYii32JVGKEdrUOLLIRELKsfVXg49VHbtABZ
	HOVSHwcjM10hKC4ZwHd5kmST99hNOwcNAcpbGBARKz86NruaWSKeqbC0NZNri/c13GFJ0l0kwl57G
	285tjCuzIgTwRRfE1IoStWU1yXAvAMwXLMqlTCAeUxIzWatjCgXotO0G6GYuhBwZi4nMmOtfU6Y+R
	t1q5c0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smM4P-0000000A8IL-06pz
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 23:39:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smM4M-0000000A8Gf-2xey
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 23:39:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQORq025486;
	Thu, 5 Sep 2024 23:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGkirmq6fdULqUsQlJs0l6hHXX5W6RsKQ+g7CB6M+KI=; b=jxIOBb+XkJVSas4w
	82bTamB+w/FCONStXwY+sZF7ZhW9h/z1Yd0aDswsDE+vHcsNXpzWSdtwGFTof+6B
	Tx18Nmq2vtHAlhvJMGe6FDqb6Iv2oknmumO/Vqb23W/qFwwKTywkYF9CjYZhyMnq
	2C+AmFO9/gsD7FhO4gjJiUP6+CGBwkiUwV46GslI8iyR9UPa8MySEs+HP4MPGbGX
	UXNZz9oQE2NG92wUUFmSHhmL7dStRmKMe5qSnTdSOrbvA+PbIa+8EVT6wUkjCG+q
	1BEpEE2dHKxJen0rexAMlo2+TOQv/kg+2wqH40+kq+Hzw2xbFfhHWKZnzMwZmxmQ
	udBKxQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhx08j31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 23:39:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485NdGJO030539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 23:39:16 GMT
Received: from [10.111.181.108] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 16:39:16 -0700
Message-ID: <40685b52-10fc-428c-bd6c-89a047b7520b@quicinc.com>
Date: Thu, 5 Sep 2024 16:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] wifi: ath12k: add 11d scan offload support
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240905023511.362-1-quic_kangyang@quicinc.com>
 <20240905023511.362-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240905023511.362-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RANY-anpexWcItgv2evechUfZS14D-Q5
X-Proofpoint-GUID: RANY-anpexWcItgv2evechUfZS14D-Q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 mlxlogscore=782 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_163918_914877_64AD982D 
X-CRM114-Status: GOOD (  14.77  )
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

On 9/4/2024 7:35 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Add process of event WMI_11D_NEW_COUNTRY_EVENTID. Add handler for
> WMI_11D_SCAN_START_CMDID, WMI_11D_SCAN_STOP_CMDID.
> Use WMI_11D_SCAN_START_CMDID to trigger 11d scan then firmware will
> report 11d scan result by WMI_11D_NEW_COUNTRY_EVENTID. Host will
> update the new country code back to firmware.
> 
> The priority of 11d scan is WMI_SCAN_PRIORITY_MEDIUM in firmware, the
> priority of hw scan is WMI_SCAN_PRIORITY_LOW. Then hw scan will be
> canceled when 11d scan is running.
> 
> To avoid this, need to change the priority of first hw scan to
> WMI_SCAN_PRIORITY_MEDIUM. Add wait_for_completion_timeout() for
> scan.complete in ath12k_reg_update_chan_list(). Plus another existing
> wait in ath12k_scan_stop(), there are two places to wait the
> scan.complete. They run in different threads so it is possible that both
> of the enter into wait status. Therefore use complete_all() instead of
> complete() for scan.complete. complete_all() can work well when it is
> only one thread wait for scan.complete.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Co-developed-by: Kang Yang <quic_kangyang@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



