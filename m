Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC40CD98F2
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrtbwHg7g8B0ePTgRXRw8zIJ6gu911BC8063CDsGf/8=; b=PjFjsM/v3LxC1FcXmeFm89mnlJ
	ye5Fm7s4H29sZth3jJ76JziM319o7g0vlwKIyWRPOnRhNd0jaVRUPU5XL3k+dTRQ3NoJt1sw8ISo/
	xdd2Ie8R47fIuYK7QgfUSAd45du+VVG8khVhBrzM/AJ51v3blgdAF1wTLSoHqa9xPU48qvTwXyxlE
	Wr49oNzQCImcEpBu+eldXK/QLRnKAR/xEHuImls9x3l9DIpXC6uWSOG21NjdPlhK89irH4TZd+1Hk
	PycXEF7nNcAn0lSnDYxgb/7xM47G1fq97uUUmN3x8SkROQ9aQGqu6p9hoMzZ16w/68rFCuhRpXuYb
	ZdAWMwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6YN-00000000iSK-1oz2;
	Thu, 18 Jun 2026 06:48:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6YK-00000000iRs-2YOK
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 06:48:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I6eXv01010712
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 06:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrtbwHg7g8B0ePTgRXRw8zIJ6gu911BC8063CDsGf/8=; b=BmyuCYaLWZOqeEcR
	ReR71vFQSmzERD6YQ9tM8buA4DyxJEc7fOXeAsXo4JAmsWBy4NbbmxF+2nVGw950
	y+S/CBeCrAzCzNqaZF2WpJmBg6fL8aCXXQytoEV264lhfzzPwiF+TG5p+JTkgkVH
	LHJQXJYTHcI7WCfwWramiaUHNf835oUb9OQdEf0moSy/2KRN/+JviblpVuDUNGL3
	GlyR9my6z/zSa9+EcgBD/9cqqU4SarrSlig5OmSl8iLpo8ToZOs3m1+H+nMovGe1
	ctCs+XLCYAdxhWOuVYlgqA5++t7kQpwmCXSdlMFhHUdxDRrC53SZB2S0TG2rI6uD
	uI6VHA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2juabe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 06:48:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842208d5b0eso409962b3a.3
        for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781765318; x=1782370118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrtbwHg7g8B0ePTgRXRw8zIJ6gu911BC8063CDsGf/8=;
        b=NBTIF0PwWlL0q1TI+GPqhIkr4PvOCUYQBZMjlEQkPnXtdIrU1ihoUbHtyDRQxXZ7hA
         iF672CjtEhdN24xeQBWcnqvJFXZ7OIqfGKbtVK+0PhzNVXnnVb2Uq4MmIZCAdmKCBwSU
         V8RQNA5YKmtGqy+TWDoty2j3f1/eyljne+Cq+XdDaoOPk2atp4QbuA4GAsUeGp3OJTjt
         ETCtlyEsePTHtQ4+IJSc8GBqsr595g4aAyWWohEEjnddlOh0gjoyRR4OA6P5xbWd+V3z
         5b3BraglrZycuS5sN2WyC6O0pJ/K+XY7GTE84smY8hRX19sCYqgaaLl/GZx9FNhCt71l
         dr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765318; x=1782370118;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrtbwHg7g8B0ePTgRXRw8zIJ6gu911BC8063CDsGf/8=;
        b=q9wpE/ge9sbse78f4U9dsGWf12EwLyHLQiwi+6rCvylytxwQRWYK1nvbEe1uR/2t2e
         HCvfpMpxA6NRGWsfQkPXqMBRK0XkkHa22tRu71DCoF73nWSpu6/zMIObZfl7JuwS+J7m
         BuHFzQF4OOFcuAmGzkr1X+weGws94cjHVRsIWhoFJl6iU3Vg7tXxBGT8WapP5xjpCvAm
         8D8axd45Gwvl+yh2xhSGlNITLYsB8fLoVIMJKbKpbcMgljojB1N18xQ6ofShaApD11sL
         Sr/hWk5Ci9FbQt2qrKACqKFdNTasu/Fk3AO1MFeBeLmYgIAxw2tjifPcCzyyGAyKi07L
         vz9A==
X-Forwarded-Encrypted: i=1; AFNElJ+PxSfRo8PSwUoIRvLaxPfqpeZEEaE0QSZvFicuRDRbgX5mjx2nqlF9LODbPWzkwdxvra8icTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YztMaOMKT44J6ncQRAtyjH/LbMRdEtpBjLt4V+67OgT4lomaszf
	w0RbfrzXwQZQMSzZPCdfiRO9g5LmIy9pBbDLnjHSwY5sP3ZOtfE98D6WVAI6wR3kwKdVflgrQwI
	S2WjrbmQPns/vrpmLBGXbdZV7Y38WPewRlrVYDCKbekAR64OEyetqAlkmN5G1Uts0
X-Gm-Gg: AfdE7cnKcwnMZKINOYHKq9bjGsqGJ/1FnTucimUaCtFqe37LuXewcQvnzcJzRhovCx0
	luuJ2Ve1Ncq8Q/qOZiZC7IPUqaO/hesnY+NE9pDDKMeFZqTvZUZtEAsvoViYFSztH3HQWS0eKaz
	kztdhji3G3FuV6VMjMwSCtr3cMt0yAmtlsgp4oeDbrtfTTAekNIJeMG62uAQDqoBaUToIWeHF0G
	xB95rMXD/pNYuM7wV2Yd6YxcTJQGvmkGX7hu69flV/XbjQ76ZKFN2kqkeCvYRM85RP2NINuKUqt
	Ky7PwF0GSKKzhhOx9mLyGmfIBeLJUrgRmGQUJAr6xNy0OYOYjFKAK4S+rFb1YKXfh0YyXqcLXnu
	YulfTUeDphPzciI1uN8tUuR9V+NKnu358x65tBTo8uqoeQw+ssTU=
X-Received: by 2002:a05:6a00:3e22:b0:845:36e8:7a96 with SMTP id d2e1a72fcca58-84536e8a65bmr3566353b3a.26.1781765317682;
        Wed, 17 Jun 2026 23:48:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e22:b0:845:36e8:7a96 with SMTP id d2e1a72fcca58-84536e8a65bmr3566310b3a.26.1781765317155;
        Wed, 17 Jun 2026 23:48:37 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm17984566b3a.36.2026.06.17.23.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 23:48:36 -0700 (PDT)
Message-ID: <7f3f0f10-3493-49b7-ac6d-cc5efca24746@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:18:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add QMI capability negotiation for
 dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2MSBTYWx0ZWRfX0LjHcwXmEMGR
 qMMQfqbmaDsJ/OZ1s24bJtgSJTr13sIsdp+MF88qUqyDmpYXMtTq6hWQ1keSZO6pTICt1C65RyC
 FGK42EJuFWMfKyWY3JuWQ7zX26M36OGE0Jq6ge1mZOyMYrU12QHOl85UWI+3wc9Dlg5Ty0VEmXk
 zL7rFr8C1O8RZ2Exc7FGdrAePdwKaPHXdXKFbdOgsSHP1STD5UChj+n7qg4SALIHHVllXjL2z5S
 q5NgxgLTYLuSelpGUNz/+ttNGfcOhDoaqpUI0NZw6zyYrEMNUkK67FOjPZAXiOJZhuFKZXIxeLK
 M7m41hr8MImZvrIAxF3fkTgDff22aAQLH8ELjfgxtcqpP+C8AptE2axnTBcn78S9IIcuRfOPuhC
 D7CncrtCftxK2Gq4xvxl8mKzeyBD25rWBTKgMzXGLzVNa4AzEPuC3P0UntBLalWjfRGD2PkGGg8
 kydu08kALgjvd2NvS6w==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a3394c6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EZ2K36TrA9c0KxPFFEEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ADM8WcQyvJkdxuDG8yynfUN42A3g7OmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2MSBTYWx0ZWRfX8ebWCxUdNsLH
 cv9bOhYqrEvyWNi1eMlENnr1ZCG1FFeq9c+ndW2eeW2ejLnmtds3q/srf5ahw0HLfqw9oJe4jT4
 vvPmJLlpq9Il8U09IkBSgPq1tvfa7kU=
X-Proofpoint-GUID: ADM8WcQyvJkdxuDG8yynfUN42A3g7OmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234840_770358_35523B74 
X-CRM114-Status: GOOD (  24.99  )
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

On 6/1/2026 8:48 AM, Aaradhana Sahu wrote:
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
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/qmi.h | 10 ++++--
>   2 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index fd762b5d7bb5..85406d6e6da1 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>   		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>   					   feature_list),
>   	},
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
>   	{
>   		.data_type	= QMI_EOTI,
>   		.array_type	= NO_ARRAY,
> @@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
>   		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>   					   single_chip_mlo_support),
>   	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x17,
> +		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
> +					   dynamic_ddr_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x17,
> +		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
> +					   dynamic_ddr_support),
> +	},
>   	{
>   		.data_type	= QMI_EOTI,
>   		.array_type	= NO_ARRAY,
> @@ -2248,6 +2284,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
>   	if (ret < 0)
>   		goto out;
>   
> +	if (ab->qmi.dynamic_ddr_support) {
> +		req.dynamic_mem_support_valid = 1;
> +		req.dynamic_mem_support = 1;
> +	}
> +
>   	ret = qmi_txn_init(&ab->qmi.handle, &txn,
>   			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
>   	if (ret < 0)
> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>   
>   	ab->qmi.num_radios = resp.num_phy;
>   
> +	if (resp.dynamic_ddr_support_valid)
> +		ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
> +
>   	ath12k_dbg(ab, ATH12K_DBG_QMI,
> -		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
> +		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %d dynamic_ddr_support %d\n",
>   		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
> -		   resp.num_phy_valid, resp.num_phy,
> -		   resp.board_id_valid, resp.board_id);
> +		   resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
> +		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
>   
>   	return;
>   
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
> index 2a63e214eb42..dbde76e5a78d 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.h
> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
> @@ -156,9 +156,10 @@ struct ath12k_qmi {
>   	struct m3_mem_region aux_uc_mem;
>   	unsigned int service_ins_id;
>   	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
> +	u8 dynamic_ddr_support;
>   };
>   
> -#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		261
> +#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		265
>   #define QMI_WLANFW_HOST_CAP_REQ_V01			0x0034
>   #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN	7
>   #define QMI_WLFW_HOST_CAP_RESP_V01			0x0034
> @@ -258,7 +259,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
>   	struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>   	u8 feature_list_valid;
>   	u64 feature_list;
> -
> +	u8 dynamic_mem_support_valid;
> +	u8 dynamic_mem_support;
>   };
>   
>   struct qmi_wlanfw_host_cap_resp_msg_v01 {
> @@ -267,7 +269,7 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
>   
>   #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN		0
>   #define QMI_WLANFW_PHY_CAP_REQ_V01			0x0057
> -#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN		18
> +#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN		22

this is not used anywhere, but since you're touching it should this be 
26 ? response TLV 7, num_phy 4, board_id 7, existing 
single_chip_mlo_support 4, and new dynamic_ddr_support 4


--
Ramesh

