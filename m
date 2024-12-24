Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C28E7718D
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDuegCdFljWMdTYersPEGxLbyjIP1ixSN+H36GV7jas=; b=PGrRH8eiawt8RvvmlA7Ajo6MVD
	MltBLOe63kU72xlO/lfYHferYj4px/4mtzDDXY+a0Y2Xficz1ccvBoxLFPGw+PWr4pxZMKCNs/QQ+
	PkVsoh1+ZYOw1bUM3RPBJ2+M6pz4VfOcSwzfT8ZvEaiiq4qYKOHGtG3+bZR86ggdqadkyjcGPvkRQ
	HW+nD7pe5ZwZl9nLVzI8TZvFQRlOdu/uURofPU+s9hsaW0yNrQJKbGc0GE99JBl/AiqL0jj/5s+i7
	mZTjN1AgsZMf809NOauU5Fh/sK1UVNvqdpBNOa7g+3sUyJGtiXWdz2oJp1npUx+VuSRFHChp/dkl0
	qw+V+YPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ20s-0000000BjWC-1fR1
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 10:19:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ20q-0000000BjVc-3P3e
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 10:19:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO6wHSS026242;
	Tue, 24 Dec 2024 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDuegCdFljWMdTYersPEGxLbyjIP1ixSN+H36GV7jas=; b=kZvVAONzbFT+oNDR
	18V4gDToKsmZg6lQ7j6xkpI1nJ8Dpkk5686KVeIrNjSGb4hdOjPc0bJtQtP1zQeb
	pXEb5Q8/EWfd/oIVCbEJrAjhm3yR5lqXVZlRT9D7Dx9pdy4UCz9soztTNnqmyUjP
	wS/kLboe3QVZRmibP8szt6p85vC4lwAJQsHWzFXCp84mzsUCfdX0wmv/fuyti4oA
	nF0WcMqS0alci1hW9kqE1l96+GHE1y821Uy718AMxhBYAaPAvaOZnZkKAcE6F8df
	aSqa+Sw6ihyYf0ckY1hv7pWM4AHnOoJCQ8YdXoZ2B/m19npUWsqOohrNRAKHwR9R
	RobMDA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qr55s3gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:19:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOAJbFN020209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:19:37 GMT
Received: from [10.152.206.29] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 02:19:36 -0800
Message-ID: <bf29abbd-778e-401e-a973-32447ef3f620@quicinc.com>
Date: Tue, 24 Dec 2024 15:49:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Add API to print s8 arrays in HTT stats
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
 <20241217095216.1543923-5-quic_rdevanat@quicinc.com>
 <87zfkrhokh.fsf@kernel.org>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <87zfkrhokh.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZDnT0dqhyI9ZNNcufw7H2AZbT0IrXlEE
X-Proofpoint-GUID: ZDnT0dqhyI9ZNNcufw7H2AZbT0IrXlEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_021940_868460_3D785661 
X-CRM114-Status: GOOD (  20.09  )
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



On 12/19/2024 5:28 PM, Kalle Valo wrote:
> Roopni Devanathan <quic_rdevanat@quicinc.com> writes:
> 
>> Currently, print_array_to_buf() is used to print arrays to HTT
>> stats buffer. This API supports printing only arrays with 32-bit
>> unsigned integers. Add API print_array_to_buf_s8(), which
>> implements print_array_to_buf()'s functionality to all the
>> arrays with 8-bit signed integers.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> 
> s/API/function/
> 
> And maybe not even use the term 'function' that, saying foo() should be
> clear anyone that it's a function.
> 
> An example output would be nice.

Sure, Kalle. I'll modify the commit message in next version.

> 
>> ---
>>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> index 4569ff40e9d8..621676daf971 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> @@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
>>  					footer);
>>  }
>>  
>> +static u32
>> +print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
>> +		      const s8 *array, u32 array_len, const char *footer)
>> +{
> 
> I would rather have a separate buf_len variable instead of silently
> assuming it's ATH12K_HTT_STATS_BUF_SIZE, much safer that way.
> 

Sure. I'll change this accordingly.

>> +	int index = 0;
>> +	u8 i;
>> +
>> +	if (header) {
>> +		index += scnprintf(buf + offset,
>> +				   ATH12K_HTT_STATS_BUF_SIZE - offset,
>> +				   "%s = ", header);
>> +	}
> 
> Empty line here.
> 
>> +	for (i = 0; i < array_len; i++) {
>> +		index += scnprintf(buf + offset + index,
>> +				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
>> +				   " %u:%d,", stats_index++, array[i]);
>> +	}
> 
> Empty line.
> 
>> +	index--;
>> +	*(buf + offset + index) = '\0';
> 
> Avoid pointer arithmetic:
> 
> buf[offset + index] = '\0'
> 
> But first check that 'offset + index < buf_len'.

Sure, I'll make changes in next version.

> 
>> +	if (footer) {
>> +		index += scnprintf(buf + offset + index,
>> +				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
>> +				   "%s", footer);
>> +	}
> 
> Empty line.
> 

I'll add empty line where it is necessary, in the next version.

>> +	return index;
>> +}
>> +
>>  static const char *ath12k_htt_ax_tx_rx_ru_size_to_str(u8 ru_size)
>>  {
>>  	switch (ru_size) {
> 

