Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5328DD3A67C
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYiJoY8A5pMBR/rhMRuFhjOCgQjdrkdDOjvUWidb9uY=; b=Pev/wYCfMkHEVDDF63M94Na/1Y
	eOZ8PwDgsFp4MD+/AQiUS1yAj8QTIaPsbiyv8aYX3EqZj8TMoSFc8CbDs3uSLhfSHpi4r/mPRTLwX
	RfWDwY4v5qP6vbpXuIM9eO1pq/acFE1U/da8wFsKGVm0ztCbrAhHGPUUmumm+ipeRdpmHlh6J6VN2
	Ho3MASPbdzstEqmMa7bDOy+ofzX68VK1g8h7U4kf6mLM07H/jk9MlxFpxKO/lq0ctDyPc4/LuaM7l
	hn5N/cnnOtnMobuM+vsQtS5CiiMArifaRvBqCmcZabn8ocSSWTvEYbLehxgZFjj+FDRvYWJ2drPVE
	JlYkZDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDj-0000000FWhd-0900
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 18:45:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ohv-0000000F3S7-2WS9
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 16:04:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T8oo0G028890;
	Tue, 29 Oct 2024 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYiJoY8A5pMBR/rhMRuFhjOCgQjdrkdDOjvUWidb9uY=; b=aiBx4adaMtjVQVUg
	N9x2MjqMbn0mZ6c8chSTxutECxx/0zwfkGwV9A8HfGLLinKyPu53XeSJzO+5j5q4
	qENQvUYAqIoNP8AUAk8fqwB19ya3rmUK4Exhb53D8J5uFVxMq/+eZIj+RQTFrddH
	yCGEQhdqJ/rjqfTsxW5L/saHCd0lldEBvbjZ6RTLwH/adpXBozFQSXgK9PfuDV+S
	miUV+EgVSmMFoVqJv61JpC8duU2iic2o92kyCbSTukgN4umJGitAiOXolxCCEX9X
	1xR4dcBJPVc3MTEHI4Tfs5FHnFmr4nKWn0WcPFc5YQRJDKOrOdd9TcTq5smnmXbl
	ViApnw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8gyth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:04:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TG4V3K017410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:04:31 GMT
Received: from [10.48.242.156] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 09:04:31 -0700
Message-ID: <682c898b-7143-42a4-bca6-07f4d178fc44@quicinc.com>
Date: Tue, 29 Oct 2024 09:04:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] wifi: ath12k: add multi-link flag in peer create
 command
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-7-kvalo@kernel.org>
 <f8049c99-c7ac-410c-84fd-ac844041f34c@quicinc.com>
 <87wmhqgb0r.fsf@kernel.org>
 <8d4aca1d-e48d-48e2-bacf-fdfe49c8e212@quicinc.com>
Content-Language: en-US
In-Reply-To: <8d4aca1d-e48d-48e2-bacf-fdfe49c8e212@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8diI7z0ZZWcwaOYefqiJC1EaX77M7P6F
X-Proofpoint-ORIG-GUID: 8diI7z0ZZWcwaOYefqiJC1EaX77M7P6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=759 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090435_681497_AA5B0BE5 
X-CRM114-Status: GOOD (  14.43  )
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

On 10/29/2024 9:01 AM, Jeff Johnson wrote:
> On 10/29/2024 8:54 AM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>
>>>> @@ -1244,9 +1249,23 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
>>>>  	cmd->peer_type = cpu_to_le32(arg->peer_type);
>>>>  	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
>>>>  
>>>> +	ptr = skb->data + sizeof(*cmd);
>>>> +	tlv = ptr;
>>>> +	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
>>>> +					 sizeof(*ml_param));
>>>
>>> using the same TLV size both here and for the TLV that follows doesn't seem
>>> logical. is this missing + TLV_HDR_SIZE to account for its own TLV header?
>>
>> I have forgotten the details of WMI voodoo so I can't really comment
>> right now :)
>>
>>>> +	ptr += TLV_HDR_SIZE;
>>>> +	ml_param = ptr;
>>>> +	ml_param->tlv_header =
>>>> +			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
>>>> +					       sizeof(*ml_param));
>>
>> But did you notice that here is used ath12k_wmi_tlv_cmd_hdr() and it
>> reduces the header size:
>>
>> static __le32 ath12k_wmi_tlv_cmd_hdr(u32 cmd, u32 len)
>> {
>> 	return ath12k_wmi_tlv_hdr(cmd, len - TLV_HDR_SIZE);
>> }
>>
> 
> Yes, I missed that since that is evil to use the _cmd_ TLV function on
> something that isn't the command TLV.
> 
> Please fix to use the standard function and subtract the thv header size from
the *tlv* header

> the length param

also note there is the existing inconsistency that some WMI params structs
include the tlv header and some do not. IMO that lack of consistency will also
impact maintainability.

again something for the TODO list.


