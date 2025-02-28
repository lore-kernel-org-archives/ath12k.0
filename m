Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82553C282C6
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toaKbtWzPqfCKonl++yXx0474yo6RKTVtoUSN/vQrF8=; b=waauBuzrx2+ZQ9GqVJnMwtM+Vh
	0fs5dtAn82BAS4T+r0auxurn7AO5Y0L8WLxQ5kKAnZKWi1N+xPLsTF2Yxj4tvv8GPiQXM3nblRz/H
	pLrS3HRHDm/99Ft199hBKQE79j9AuEk/6EJE/PfhJADVipPuE3s0/djp6GuBkubgAymg+uOUKOyi4
	okYhNG1smQtwQB8nmP9EPhCKsR9Kh3aGwpvPYcGDCQqJ5glO8dCpzOu+G9w+7GNOpC8U5u/dfPzpp
	QsuFhB/fwioRkLl7cah6WnOoHXRwlCWPgz6dkVlK+wS+t1W037J47zVs9IM8c7F3DWo4p4Tu5P9uL
	ERcufA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2z7-0000000BcFh-1ACY
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 16:13:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2sf-0000000Bb9T-0xJY
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 16:06:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXFD3020127;
	Fri, 28 Feb 2025 16:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toaKbtWzPqfCKonl++yXx0474yo6RKTVtoUSN/vQrF8=; b=AzI0zl6QB8CN6n1Z
	YULzHYME47bzzjuyL0Hk25qD+1AzCNPMhdjcAxBom/bxDEXO6NQvbdz8Y0GMgNjw
	Zu470QjN56RcFX+MM66chsJV4kF39pg6lHyi/pGT+yYGO4Bn/qxx9SyaUgnxXksZ
	ui9R6W7ygL8i0IvM3X9WDKANf0lD2+zpLms/TApDAc2eYSpz5jSHRKHUjraYHGHL
	mEf44YT7+o5Qtd9xIGAkxApdGCzSwd/7hhDsLxbQtef+4Wln5Bkb7Bkqb9obLNBR
	WDOkSziN43njgHtqJdNaNdCSTyxAFw60tUuBJWBVqwWxv1iXYiQPJ20sZtjTHzNU
	5DEbpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4539uphaap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 16:06:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SG6PhO011248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 16:06:25 GMT
Received: from [10.216.20.93] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 08:06:21 -0800
Message-ID: <8f35ef14-49e8-4484-9a66-58b91a537681@quicinc.com>
Date: Fri, 28 Feb 2025 21:36:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/13] wifi: ath12k: add support for fixed QMI firmware
 memory
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250227191034.1949954-1-quic_rajkbhag@quicinc.com>
 <20250227191034.1949954-8-quic_rajkbhag@quicinc.com>
 <e702e39a-e199-4ea4-a066-0b2e26253f98@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <e702e39a-e199-4ea4-a066-0b2e26253f98@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FsXWok401kwqd_11_vK3FRmt0B_GHnf4
X-Proofpoint-GUID: FsXWok401kwqd_11_vK3FRmt0B_GHnf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_04,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_080629_284964_4DB7E218 
X-CRM114-Status: GOOD (  22.56  )
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

On 2/28/2025 9:08 PM, Jeff Johnson wrote:
> On 2/27/2025 11:10 AM, Raj Kumar Bhagat wrote:
> ...
>> +static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>> +{
>> +	struct reserved_mem *rmem;
>> +	phys_addr_t bdf_size;
>> +	int i, idx, ret;
>> +
>> +	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>> +		switch (ab->qmi.target_mem[i].type) {
>> +		case HOST_DDR_REGION_TYPE:
>> +			rmem = ath12k_core_get_reserved_mem(ab, 0);
>> +			if (!rmem) {
>> +				ret = -ENODEV;
>> +				goto out;
>> +			}
>> +
>> +			if (rmem->size < ab->qmi.target_mem[i].size) {
>> +				ath12k_dbg(ab, ATH12K_DBG_QMI,
>> +					   "failed to assign mem type %d req size %d avail size %lld\n",
>> +					   ab->qmi.target_mem[i].type,
>> +					   ab->qmi.target_mem[i].size,
>> +					   rmem->size);
> 
> The v6 version had a kernel test robot build warning here when building for
> MIPS and it looks like nothing has changed.
> 

The kernel test robot warning came just after I posted the v7. Thus, the v7
version also have the same warning. I will send v8 in sometime to address this.

> I don't know the history of why struct reserved_mem::size is of type
> phys_addr_t, but that type has a different size depending upon architecture,
> therefore you can't use %lld.
> 
> To print it correctly you either need to use the %paa format that is meant for
> that type, or probably better would be to assign it to a variable of type
> size_t and then use %zu (and use that variable in the size test as well)
> 

Sure will use variable to type size_t to address this.

> (also consider if the other %d formats should be %u instead)
> 

will update to %u.

>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +
>> +			ab->qmi.target_mem[idx].paddr = rmem->base;
>> +			ab->qmi.target_mem[idx].v.ioaddr =
>> +				ioremap(ab->qmi.target_mem[idx].paddr,
>> +					ab->qmi.target_mem[i].size);
>> +			if (!ab->qmi.target_mem[idx].v.ioaddr) {
>> +				ret = -EIO;
>> +				goto out;
>> +			}
>> +			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
>> +			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
>> +			idx++;
>> +			break;
>> +		case BDF_MEM_REGION_TYPE:
>> +			rmem = ath12k_core_get_reserved_mem(ab, 0);
>> +			if (!rmem) {
>> +				ret = -ENODEV;
>> +				goto out;
>> +			}
>> +
>> +			bdf_size = rmem->size - ab->hw_params->bdf_addr_offset;
>> +			if (bdf_size < ab->qmi.target_mem[i].size) {
>> +				ath12k_dbg(ab, ATH12K_DBG_QMI,
>> +					   "failed to assign mem type %d req size %d avail size %lld\n",
>> +					   ab->qmi.target_mem[i].type,
>> +					   ab->qmi.target_mem[i].size,
>> +					   bdf_size);
> 
> the same issue exists here.
> again this would be fixed by making bdf_size type size_t and using %zu
> 

Will use a common variable (size_t avail_size) to address this and the above.

>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +			ab->qmi.target_mem[idx].paddr =
>> +				rmem->base + ab->hw_params->bdf_addr_offset;
>> +			ab->qmi.target_mem[idx].v.ioaddr =
>> +				ioremap(ab->qmi.target_mem[idx].paddr,
>> +					ab->qmi.target_mem[i].size);
>> +			if (!ab->qmi.target_mem[idx].v.ioaddr) {
>> +				ret = -EIO;
>> +				goto out;
>> +			}
>> +			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
>> +			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
>> +			idx++;
>> +			break;


