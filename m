Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B2C27C4F
	for <ath12k@archiver.kernel.org>; Tue, 18 Jun 2024 05:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJWQt3P/f6ssh6oPbuqXdOhkkqHXG+vxc17Pr2YVQ+g=; b=L7gWsqDtnFO9H24g0wG+x6xa/c
	oRvuNYOXq3S5WH+cWuxdvaT9LF9EVPwTsb+5eBKAidCuHLSjltJ5jaICSMcj0oYaUFOs7EzAvIOHo
	hW3WZrITo8kdE66jerQIFjY4Xgb15ll1BOSuJ2mSmQXhDzJmoD9NX3DDVefm2C1H1m3nUllvim/yE
	0MsU4ccUg51J+8+Lb1aGfTz06VfYFjoGqeNWIFedhKful1+FYvHgMzwgk0RQHCrJvYpAxca/Vox3N
	1IAB0KWbQ9hwXUlXjt3rR7rEw3HcX2bCkfwvneO5rYm3FbC0cRdFaKCUE3OHNOf/iEFtFWXq/6tfW
	ZzGuxlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJRiy-0000000DiL5-16kc
	for ath12k@archiver.kernel.org;
	Tue, 18 Jun 2024 05:49:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJRit-0000000DiJr-0eef
	for ath12k@lists.infradead.org;
	Tue, 18 Jun 2024 05:49:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I2HgYW000845;
	Tue, 18 Jun 2024 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJWQt3P/f6ssh6oPbuqXdOhkkqHXG+vxc17Pr2YVQ+g=; b=eLPEPlo9/6Uq5cb8
	OT6k3a8RkyMHo53tuxvUEhIe+z2doSYcKDcX+PlzxOrWuYW/xIT+nrKdORX3I0zb
	YykMXIdisBzezX/JylzaEv6CaI5nHOjGIeWlI/FUYMCOFKuR4yRtiWesUDio5gAd
	iydf5RwXEOJoxWK6ddOBcki2ujh3E/IdfxLfXsz5Dd01eVh/6pmOvTCulgRdHDdx
	GF+pb6tdKz5y/Fy++QSHbrpdDbX90xorExcPF3sWi0Z6c5kd/cYAbhPUXxKeyZc8
	R33ph4MnPwFneaEmX/hbfz3BZ9lqI1xBpoFysuQ9E39QICuj7iVZMWztCm6lAucz
	PIpuAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu1b0rbsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 05:49:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I5nXco003260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 05:49:33 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 22:49:32 -0700
Message-ID: <f66c2719-f413-4348-8440-97a169430043@quicinc.com>
Date: Tue, 18 Jun 2024 13:49:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] wifi: ath12k: implement WoW enable and wakeup
 commands
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240604055407.12506-1-quic_bqiang@quicinc.com>
 <20240604055407.12506-3-quic_bqiang@quicinc.com> <87msnjn0qs.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87msnjn0qs.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HoFiZzD_QeGLbs4loHUtUqhNG3scUk2d
X-Proofpoint-ORIG-GUID: HoFiZzD_QeGLbs4loHUtUqhNG3scUk2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=741 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_224939_389054_035BFBDE 
X-CRM114-Status: GOOD (  17.04  )
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



On 6/17/2024 9:43 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> Implement WoW enable and WoW wakeup commands which are needed
>> for suspend/resume.
>>
>> Tested-on: WCN7850 hw2.0 PCI
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> [...]
> 
>> +int ath12k_wow_enable(struct ath12k *ar)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	int i, ret;
>> +
>> +	clear_bit(ATH12K_FLAG_HTC_SUSPEND_COMPLETE, &ab->dev_flags);
>> +
>> +	for (i = 0; i < ATH12K_WOW_RETRY_NUM; i++) {
>> +		reinit_completion(&ab->htc_suspend);
>> +
>> +		ret = ath12k_wmi_wow_enable(ar);
>> +		if (ret) {
>> +			ath12k_warn(ab, "failed to issue wow enable: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = wait_for_completion_timeout(&ab->htc_suspend, 3 * HZ);
>> +		if (ret == 0) {
>> +			ath12k_warn(ab,
>> +				    "timed out while waiting for htc suspend completion\n");
>> +			return -ETIMEDOUT;
>> +		}
>> +
>> +		if (test_bit(ATH12K_FLAG_HTC_SUSPEND_COMPLETE, &ab->dev_flags))
>> +			/* success, suspend complete received */
>> +			return 0;
>> +
>> +		ath12k_warn(ab, "htc suspend not complete, retrying (try %d)\n",
>> +			    i);
>> +		msleep(ATH12K_WOW_RETRY_WAIT_MS);
>> +	}
>> +
>> +	ath12k_warn(ab, "htc suspend not complete, failing after %d tries\n", i);
>> +
>> +	return -ETIMEDOUT;
>> +}
> 
> Why the loop here? Looks really odd to me and no explanation why it's
> needed. ATH12K_WOW_RETRY_NUM seems to be 10 so this can loop a lot.
Host asks firmware to enter WoW mode using a WMI command. While receiving it, firmware might be busy so that can not enter WoW immediately. In that case firmware notifies host of ATH12K_HTC_MSG_NACK_SUSPEND message, asking host to try again later. Per firmware team there could be up to 10 loops.

> 
> ath11k seems to have a similar loop and no comments there either. I
> clearly missed that in review.
> 

