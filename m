Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D27DCDB479
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnUrOm0jOF2HVTeAUGtjnEXVGqZWWgWnDQ6liGwYCcc=; b=DUKx675CoW5L+ppXnkPaB9kRl9
	EgktkVGJMTV3Fx5gWerx+DIR3/zeRObpjwhncwt84Y2Ma6+n9yuUxIkzMBgqQEo4d/TSawqMfLYIS
	S3sC7P27ZO815AwUluYlYSBVCd0XUq6BRfRX8OnjY8ZrGzIToP5NjYcrswSl2SyPUBkgUMLa1cs8Z
	VXKb+A+gmXBJNUusqmJW0wN7nsm0ApABnDg6mj4tKVBge3H3pIAKzI5ZfE6JDvJddGueNFamdcZaq
	CgiVnihcZSF+Gscx8JJr66GP3IDShMZ7qsqSafZFyYlXRCWYYC1GDd6VMaaatZirYK93X3S+Nuz1L
	zSmn/W5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcAl6-00000006z0u-27GC;
	Tue, 23 Jun 2026 23:42:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcAl4-00000006z0V-0B8k
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 23:42:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NJwhGo617909
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 23:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnUrOm0jOF2HVTeAUGtjnEXVGqZWWgWnDQ6liGwYCcc=; b=aH1Nl1wreECVIsbD
	4HnwSz1xHQqvBD9qMvR5uTwoXzPdu1dnzjR764RGxKLZ2qjMq0f/G4/BI6TLHuDS
	QvjQzBUvoyDoDMZDKjOofVi/K72Mq9MIfI9NunR1EzdV5DxEQkIuuqu3T1dbKsTC
	Hfkadh9yIbA4tYfxOtEIyXjLLiRfLG9AWGwUCLM5lzPJ8dkr1E5ZhX1mdG0PrDTT
	+gGNXN8usud1F1fFLjQsDb/7fRe65p0csqEAdF9d4qjh7Hivy9IMm5/3/YNyZAt3
	2M1BZta4esWq75jaspEkJvvui/d+yydT2vMpa7P3+oQxR1NCQ7lICNg6fsQ5CPG+
	uO/DKQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3jmu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 23:42:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso912614c88.0
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 16:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782258139; x=1782862939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnUrOm0jOF2HVTeAUGtjnEXVGqZWWgWnDQ6liGwYCcc=;
        b=PiczqdMMSjbdB+Ex7ajNt5fy5roVn5Pqh6rgxDBPHdmPfsiMKo+ZqIK+4YLsitT73M
         XahIJfMSJ20Cgf4/y1pu41cgVSecTfhCpTgsCCsJ7a1PaqOFAgpwTgP4G3Ed7UlZsG7O
         1Pqowmg+fQEMFhLiurp9kNngJ86itEIBxoWW9AiXYDrQKxvmlPFJPwMXCfkkIQd6OhJ0
         Mb3ky8fohLTjzz8sk+A0NBBYlBGex21yM/xkcacWZgSz0M05zEu06WJ6dQvO+L25zzA+
         8C+lKNZjNdb3bdEf3QjQTnYvV499E7YQNigEl+7ZyIsb2oNiQk9R1lEGL3+g04o2nfKo
         1eVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782258139; x=1782862939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnUrOm0jOF2HVTeAUGtjnEXVGqZWWgWnDQ6liGwYCcc=;
        b=EauKE0F3HxA04Asu+P9+l7HoM94VbQsW4fjYKtlJouViugSDJx4L9zXXnrrcSaVGAb
         1S+YTiVN+pJrNXm0M5yj5CWPvrYW/Y/+OTVpRHMKjb7u4biTWrSEES0ClutDi6Eq1pHM
         XUL2Oy5LEPYO0/TE9cfhOPvqkXartuEATXzQy71gY/7dlZDlbpmqK6GvMhVViI9Lg/76
         Sh09NnPbjA8QQfo3NqMCAOnsHkJFuHbrMvruEOlLiMVZu1atb/7ZHdKUL4k8eZrccwUh
         7DPDTFi/PwlyDqvTmBKqvMY9LwMpL9nmk+vV3vdeoGJMBQxZ1rLm3zh7C+YQrhfVVOE0
         UGdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/b+5vVY5Jji8zEmOGJhFM4b4CwIuLowvy1Sw7Lp2jBu3wWnpGNTFCZVWQgFAtOFc/+Uy2u2c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7ZKGWgE4GbyerzrEATnG5zJkweQth8RmBmiop9ETasAMn55B1
	1T2mgrEXPE7jC2knPJEP3g2l4gWL2QUfE93snh6zc+QvU7PbzEj0KUsuBZfl9JFkOihZnR04zu4
	cHtpsQNcMVxDYPm04q59qdx08zsFDiDgsqsLsIn98ycR2nHDJgTCPIZSu3LWqyGSG
X-Gm-Gg: AfdE7cn5NGFL9DFUf3ZRL0sCkutZRBeu3lBuPhB6nCnUSeNvI6gdyAeB38B0uRcrBeS
	L5H5EMWYO06cv8ajrT/G4MPkUOEXwu5oBtUJZ7yUsqTKLsaZyMfhCwC897cwkCPcJ0k/nutVq5P
	Q7jN/hujzVY75heLPa6RDy7Vin+xozg+WoCF1SMMOQfr5kfSWlvdRHCz698pegJ6j9enawbhNJw
	s3IsFAbAhQOZ2L5QFA9YhMb49L+zKu4SEONa+DNmiWoaWAIfYXG6hqg6C2GkFHaGNks9L95oOTf
	pQf+aI1cTo+YMwSCI2hW3QUozk+y3JJwJx3jH0bmPYUWCRGw2rUjnQmwq+0gZJ7QQS3Loe23ytY
	UPa91TqfU6V9QdgKm7PBVcPXYdpIJk7QLc37z8OYXOe31VqP77Y1Ih53oZSpMxB2vjxdPqy8=
X-Received: by 2002:a05:7022:305:b0:137:f532:e360 with SMTP id a92af1059eb24-139d0c0bd49mr696661c88.3.1782258139256;
        Tue, 23 Jun 2026 16:42:19 -0700 (PDT)
X-Received: by 2002:a05:7022:305:b0:137:f532:e360 with SMTP id a92af1059eb24-139d0c0bd49mr696641c88.3.1782258138653;
        Tue, 23 Jun 2026 16:42:18 -0700 (PDT)
Received: from [192.168.1.11] (124.sub-75-218-227.myvzw.com. [75.218.227.124])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5bd68sm18298383c88.11.2026.06.23.16.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 16:42:17 -0700 (PDT)
Message-ID: <44d9944c-3760-4ef5-8830-265eb2e9b896@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:42:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5NSBTYWx0ZWRfXz4zA9uJ0cMBG
 wzSiTNY7GY0KD5O1iUWSzaIamxtpLLFiFjvpnixV4vQjarlHhr49RkNME13XW8ziL9+QLRePH3E
 nNg0BT8wVDrqHtgR0nIR3OmppRjAAJU=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3b19dc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=xlPm5vGA3/o/kwQtH2yPVA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1wjBKfE2vB2PEQuW5ksA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: nA21jjHVMrRf-e_qGF2v12FNka8hwhct
X-Proofpoint-GUID: nA21jjHVMrRf-e_qGF2v12FNka8hwhct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5NSBTYWx0ZWRfX9yv2J6sdUsrf
 2K3x/WxXfySEQd7LDyTYC12Mu0Lx96hdI0x6XVbfmLtYtnFN8X29KqMWbERCeqN6oBAv5YK2PWG
 vuy5WjZv9YhaLxg4GZi4TnurWArPBjm6QFs9dylnfMsa8ONu8DpWMld9dw8GW2J+ANn7TBxZEOa
 t43fJqAZU81/O/DbWQxm7nlV+8dDygPHIopXbUhAcqI6Avi3XAAVUOSDENEYn14FU5Wb+YxatPM
 hg8oR0Efr8LqkfkejC3zkaVSjRWBn+yMo4S70YCjAEUfpGML7pyKmctgc6YWSLR0GOCDE4FynDS
 irHU2XenxEo8RXokr58RaPz99eCJyFGZcSVAUyoTJAU3uOC4zPH03yWPAvQsDlTBD/TRWpekb9V
 fE522gAUsmAVhEvxq9740ElSPkrlsPERuckdy/wWnT+sHPdYMOnzBhOOc+t2ZYLddclKiBo2zJd
 02SgRMxaKNO4hzaB7cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_164222_095317_188290AA 
X-CRM114-Status: GOOD (  23.53  )
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

On 6/18/2026 11:58 PM, Aaradhana Sahu wrote:
> On AHB platforms, firmware operates in two modes: fixed-memory mode where
> firmware uses hardcoded addresses for memory regions such as BDF and does
> not request HOST_DDR memory from the host, and dynamic-memory mode where
> firmware expects the host to provide memory addresses including HOST_DDR
> after the Q6 read-only region and relies on host allocation for all memory
> types.
> 
> Introduce QMI capability negotiation to support both modes. Add a new QMI
> PHY capability flag dynamic_ddr_support which is advertised by firmware to
> indicate it supports dynamic memory mode. When the host detects this
> capability, set the dynamic_mem_support flag in the host capability message
> to signal the host is ready to provide dynamic memory allocation. This
> triggers firmware to send the HOST_DDR memory request and use the
> host-provided address.
> 
> For backward compatibility, if firmware doesn't advertise
> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
> where firmware uses predefined addresses.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
> v2:
>   -Dropped QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN and QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN changes.

I think you needed to keep the REQ_MSG MAX_LEN change.
My prior comment that the REQ_MSG MAX_LEN macros are a layering violation was
constrained with the observation "that is a preexisting issue with the QMI
interface" so we must continue to pass valid MAX_LEN values unless the QMI
interface itself is changed such QMI determines the MAX_LEN

>   -Used %u instead of %d in the debug log.
> ---
>  drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/qmi.h |  6 +++-
>  2 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index fd762b5d7bb5..e15a0c0120d3 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>  		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>  					   feature_list),
>  	},
> +	{
> +		.data_type	= QMI_OPT_FLAG,
> +		.elem_len	= 1,
> +		.elem_size	= sizeof(u8),
> +		.array_type	= NO_ARRAY,
> +		.tlv_type	= 0x33,
> +		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
> +					   dynamic_mem_support_valid),
> +	},
> +	{
> +		.data_type	= QMI_UNSIGNED_1_BYTE,
> +		.elem_len	= 1,
> +		.elem_size	= sizeof(u8),
> +		.array_type	= NO_ARRAY,
> +		.tlv_type	= 0x33,
> +		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
> +					   dynamic_mem_support),
> +	},

Does QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN need to be updated to account for
the new TLVs?

>  	{
>  		.data_type	= QMI_EOTI,
>  		.array_type	= NO_ARRAY,

