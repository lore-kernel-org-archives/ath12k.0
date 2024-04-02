Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870F4C6FD1F
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qQkLT4Uux88eWoJBBp7qV6Eu0m4QUToEjBCWiQlbK0=; b=nok+CDT3E3EjpEiAeEi4zRv/ln
	+frS95kubthxCd/YVhdZtzoLz4idVqHbtN5JgtDBTxxFjHvHpw6/F2SwC4K5EWPZ+CyFlqsuD3kVM
	fJjfrE63XKoJJglfrp1aaBYk1GXgmz3OfnWajcV2woG3SBjXBYiD+GKEF6FQLFC+d4Yq5I8NbTqOM
	Oj7kfMbidrZQT6ZplQaSbp5ipZJ64dofuvqxPXvcZ+hgJ0Sw+xFxnkAnLn3txxCK555zLrJ6WErDf
	tqUjzR13ggWaV0RKer64ZGNkasc7cxuydim7mUU4A5NbgDepnvSLlrJJKQGxZW21YY1V7EHNvTfG0
	1qk2KdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rraVh-0000000AS3u-0vzg
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 09:32:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rraVe-0000000AS3J-35hW
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 09:32:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4328xUF9007987;
	Tue, 2 Apr 2024 09:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4qQkLT4Uux88eWoJBBp7qV6Eu0m4QUToEjBCWiQlbK0=; b=Kk
	QP/ts+uRE6MlGD0TN103hWCfSGAVj2maS6tXcZKWGMWFSBxjN3DJZEHKrqRuXNkU
	PbrMzJQtpC1zaN2algK2ZslGQJ2xf+u433sYtJlpU5Rh1c8r9f/d5/ooQY68DspW
	WNhkq0OzSTz9oZ7vaaGAlMzIArinIBOiHeQcAZbdbUKLVMtd8zdqlloWYMNWiZ1L
	7J5REKRunXjsjXcmxhJ3Ieal4T++8iI/Fnk4SwGT2eicQ+r4kSDbSEOdVUj6mzzp
	y2qr0s3ouMuTlF+zwTHh/wZbcaazbeZrrzQNuj/xbDPaI6/VbiEOfVmACD3n+31E
	pdhZK7Uvx8laxEmP3P+w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8eymg36e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 09:32:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4329Wnbl018687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 09:32:49 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Apr
 2024 02:32:47 -0700
Message-ID: <ebeb7fa3-f0d1-230a-80bc-0877fdab7e62@quicinc.com>
Date: Tue, 2 Apr 2024 15:02:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] wifi: ath12k: extend the link capable flag
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
 <20240329012358.2242354-2-quic_periyasa@quicinc.com>
 <f17ab010-5874-495a-8bd8-3e18e85cc327@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <f17ab010-5874-495a-8bd8-3e18e85cc327@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fiIdbxC4NnTCQv9HtafyEv1Hd7jQcxta
X-Proofpoint-ORIG-GUID: fiIdbxC4NnTCQv9HtafyEv1Hd7jQcxta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=871 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_023250_806206_4B08C571 
X-CRM114-Status: GOOD (  10.59  )
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



On 4/1/2024 10:24 PM, Jeff Johnson wrote:
> On 3/28/2024 6:23 PM, Karthikeyan Periyasamy wrote:
>> Link capability categorized as Single Link Operation (SLO) and Multi Link
>> Operation (MLO).
>>
>> 	* Intra-chip SLO/MLO refers to links present within a chip
>> 	* Inter-chip SLO/MLO refers to links present across multiple chips
> 
> Is "chip" the correct term?
> 
> I'm thinking that this should be called "device" since that is the unit of
> hardware that is detected by a bus probe function and which is handled by a
> *device* driver.
> 
> Doesn't this make more sense if the references to chip and SoC are changed to
> device?
> 

In the QMI, SLO/MLO parameter exposed as chip only not device. So 
followed the same terminology to avoid confusion for code readability.

struct wlfw_host_mlo_chip_info_s_v01 {
         u8 chip_id;
         u8 num_local_links;
         u8 hw_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
         u8 valid_mlo_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
};

struct qmi_wlanfw_host_cap_req_msg_v01 {

...

u8 mlo_num_chips;

u8 mlo_chip_info_valid;

struct wlfw_host_mlo_chip_info_s_v01 
mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];

...

}

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

