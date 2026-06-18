Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F3ACD98F2
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 08:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrpjNUrlYYQ2QNk8EUZ5kS30hXTdfkfIzBBCbiSoGMk=; b=y0R2Atc//A0A1pN2UYmHO8uF1b
	LAt7I1sDDb1sknoWp5bqZK7CIIT7ZJsZQ98tNh5mivulA4jv3AFWoJmLLGPIytZWJ5hF391Uq/62H
	wnrEiBrCbgE76IvUVrT0X7lbV5Xqe9VcRE028yw3n6ztUMfKRS+p2rvfAAP0seqaufZ4N2efYvBJG
	VN3sazLRzaMrHLCUnSvyUBQhCR/eND0rSn9Tt6Xy7dKKMK/4Zjuz3hmzllmN8QTARVhZVdPZuiq40
	7Ed/tIL8i7pEQSBrx9Np6TEE5aq3HWkQ0UOJTgI+j4klL+pZJ4ASoSoyBVplg2TIwZ4m/KuVvA3G7
	ycxDGkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8UE-00000000slF-0KmD;
	Thu, 18 Jun 2026 08:52:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8UA-00000000skm-3KE1
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 08:52:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1HP1157433
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 08:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrpjNUrlYYQ2QNk8EUZ5kS30hXTdfkfIzBBCbiSoGMk=; b=byYBBqlkJLVYSBBr
	7neLPa6VcrPFO339GHYccB5mcv3P4S8ZgKMy+onnfMH2QvITWhQLzDc2jS7hzDPG
	BmJ0H0EjMS7pmdGe5jf3bYMWVuMSHj33+adnrKH9nz3LdUN1edn70UkEHtQKHDY/
	bY1dHAsgZftxdFYXpf/X5Mw+rTb8lQ/5qSDlhmQ34aQXxf2BfJoRE1RHfi2Xqbua
	On2v5O+ei1kMFUuxCdT+jrySE2i8grGNivdPwxXHWuerqVWfjC8JLKkFvKp1w2eY
	HkaXa/ipCCA4YzM4OLgBRSJqKJtsd9NsskO+a1sEQWoAHSYu7YMS0c+blTdGacZS
	AxPp7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2m33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 08:52:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bc237b5aso13103465ad.2
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781772748; x=1782377548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrpjNUrlYYQ2QNk8EUZ5kS30hXTdfkfIzBBCbiSoGMk=;
        b=Vq7hQRpJtOANfUmuT+MZMYugpk3vh+oDxYbtU2bUFtreHyKp1GjT+PXZpeDHl0HRhC
         pekhRn+uwEHdwx82VcMJ9R5Iz9SUiPi9NUinoBR9FIPLvt/KlWCIGRA0Pns7ITwVFP0j
         blqeT5HQubHkSM7dIABpTLhGiZPL6VyYwJjyNSFYc1VB3TdR0v4LX2Y5MDyxV5gXxjIT
         xrdZlJrHOfyEUNKWcyjkV6PJE+RvbL/qOsfk43x8hfSBaA3uLKo5WJHksvHUPk19Aea5
         skwUbnbwD6OLGtUtHD4Aakip69YqbFmgpfrBY93iXHHNSffhLE3olMFpc2vG18p4+CrN
         KSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772748; x=1782377548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrpjNUrlYYQ2QNk8EUZ5kS30hXTdfkfIzBBCbiSoGMk=;
        b=e99ZAEmwQEZtf83LS+emssx1GTWJPtG477MWLxH/CjX6yAg7vhaVNp7F/Vr/8gnuT8
         y5EG9tnxc0CrjNhDW69lhzc0J0VvB+MtZCcd4xMikS2SvYqKm2LZAN2IpIk7ylWiDbzT
         B15DiqbCOjpjdnmIJlkyg6SFW++Edn+lOK2Lr+5qQTnofIchLFp3ECRLvFvKTKWQgHHa
         49UUBU3oyar2nnvr50uDbBxU9fuH+AkTKTCWXRkwropusj14knv/kgPDcEOwTI8qXUxI
         hvXrFy5t/HdLXbpe25S9gxHB/druLcHiAxZZRGG1nip3SQpNjDc001eHkq3kY79pP0c0
         YNGw==
X-Forwarded-Encrypted: i=1; AFNElJ/zzRnr7HcpuSHWcJZHu8E0g+ZEouRsHKHDjaa5xPe4JsBNR0PRia+s81RdVeIV5G1kCJrEWO8=@lists.infradead.org
X-Gm-Message-State: AOJu0YztSmrGuscj+su98Y1LF5PVnKPXJWTJdPRbkcbyWONd+kpXk6UU
	Bml5oRNYLNaNYg8PUljTJh0Qhmm272jLBQJT1or97VNflb26l7/Vv011IvAvdlXuiLAsrqQDw9b
	TE7gley6Qeom8s6lr8xEXNPNzyAN7krJGXVAVTdzZapdr5cq/kbfrGGjHOfkC2PR5/4v6JjgX
X-Gm-Gg: AfdE7cm4NuahUoEprQWhxLluo2h3iCpl4e3eOreb/Y87h/T3yBaPYL89LGRnSjvfbQ8
	gaZrvu9jG6zIGs7Zf87mF2wWRGtntkfE8YN5j8nb2sAlgqyd7+D+++aZNWM+y73MvYhfaEVW/fp
	PH4fkps7/57rgKArKroIDYz4lqPtfUeB3fyiyvnQWovZ3pbLmeupnAIkMzoQ8btGBCZXSZQ8MXh
	JlPwquYeusbD3W0KP2KoEHc37AGV1H+K7eHWQHEoPGKaE0jdI9oFi4eMj0F8I1ANiZG+7A+il2B
	VXwVpe1x4Uz06dV9bp4SRICLhC6OXt0VmKJjO4pFBelk71VgpqcIDixGwFTk5IIs0NWXRou4Pa8
	r6Yf6rWtJx0XedrCMIouVM0OJzx/5vlvPrHTtpU+TBS6Y
X-Received: by 2002:a17:902:e752:b0:2c2:5446:30e1 with SMTP id d9443c01a7336-2c6e4745fa8mr30200405ad.11.1781772748149;
        Thu, 18 Jun 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a17:902:e752:b0:2c2:5446:30e1 with SMTP id d9443c01a7336-2c6e4745fa8mr30200075ad.11.1781772747684;
        Thu, 18 Jun 2026 01:52:27 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac7fbsm203955715ad.42.2026.06.18.01.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:52:27 -0700 (PDT)
Message-ID: <4fc10b44-3107-4e0b-9b1f-793713c28e0f@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:22:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add QMI capability negotiation for
 dynamic memory mode
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
 <7f3f0f10-3493-49b7-ac6d-cc5efca24746@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <7f3f0f10-3493-49b7-ac6d-cc5efca24746@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b1cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BKLcScISXldYRKvFntQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MCBTYWx0ZWRfXzrnVE3IMyMDW
 lO6Tnv0Wnb2SIq6Jxkulsr2HHZ/mQC23ZiWptj6wraeMFljenZyZzIJo1NmL3bozoi131SuUxpM
 M0pZobPw2Y/EnpxwO9F/QDyN1Lj9XwY=
X-Proofpoint-GUID: lc_dQbeBYpuryB021vAA_ly-ZSjsVwNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MCBTYWx0ZWRfX8JwLO45qzfRZ
 YjeoNM4J6IivnZ5OKH8f45xEw4/EQz8e4I5ACBj0te98AclG07B3i6AjoV4iw8b+SaZhhOdlfO4
 ZzWsx+3Rtnhx1L2VS2sjNiyTdP6QWpT8zSP9L+eTQOPqtbRt7b687+pe/8GZlHYOBOVX3RbazzG
 h555kdAyKfMKMUHpltQnuB0PErAB18oW86SWHfWtel+N4tnu11JVV7mvto6PvPaMXCFQavZWfjX
 BxGBBNlfIQF0g7uXC1acNGZFHBCyGyLOnf8GaaxEsvNxk2LDU/Rto8gcw0Ba0ZM4s3Pw97ZnAtP
 1iqcn7eetGZG48BQQwmPZNm2TESdSQq2aMbM2jNok4fDAUgc2sliiW50mYX3w0ONko9awKwJ40T
 dYYttdNLOkfXGBsbFlA9G5KTjbNjBtDhpuDQnEcV+Qh6dvF2kBceZ/anL69VLuJGKyHeizvUwtV
 fYZP3od2oSgREWX0otA==
X-Proofpoint-ORIG-GUID: lc_dQbeBYpuryB021vAA_ly-ZSjsVwNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_015230_955144_11F80079 
X-CRM114-Status: GOOD (  25.39  )
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



On 6/18/2026 12:18 PM, Rameshkumar Sundaram wrote:
> On 6/1/2026 8:48 AM, Aaradhana Sahu wrote:
>> On AHB platforms, firmware operates in two modes: fixed-memory mode where
>> firmware uses hardcoded addresses for memory regions such as BDF and does
>> not request HOST_DDR memory from the host, and dynamic-memory mode where
>> firmware expects the host to provide memory addresses including HOST_DDR
>> after the Q6 read-only region and relies on host allocation for all memory
>> types.
>>
>> Introduce QMI capability negotiation to support both modes. Add a new QMI
>> PHY capability flag dynamic_ddr_support which is advertised by firmware to
>> indicate it supports dynamic memory mode. When the host detects this
>> capability, set the dynamic_mem_support flag in the host capability message
>> to signal the host is ready to provide dynamic memory allocation. This
>> triggers firmware to send the HOST_DDR memory request and use the
>> host-provided address.
>>
>> For backward compatibility, if firmware doesn't advertise
>> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
>> where firmware uses predefined addresses.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>>   drivers/net/wireless/ath/ath12k/qmi.h | 10 ++++--
>>   2 files changed, 54 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index fd762b5d7bb5..85406d6e6da1 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>>           .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>                          feature_list),
>>       },
>> +    {
>> +        .data_type    = QMI_OPT_FLAG,
>> +        .elem_len    = 1,
>> +        .elem_size    = sizeof(u8),
>> +        .array_type    = NO_ARRAY,
>> +        .tlv_type    = 0x33,
>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>> +                       dynamic_mem_support_valid),
>> +    },
>> +    {
>> +        .data_type    = QMI_UNSIGNED_1_BYTE,
>> +        .elem_len    = 1,
>> +        .elem_size    = sizeof(u8),
>> +        .array_type    = NO_ARRAY,
>> +        .tlv_type    = 0x33,
>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>> +                       dynamic_mem_support),
>> +    },
>>       {
>>           .data_type    = QMI_EOTI,
>>           .array_type    = NO_ARRAY,
>> @@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
>>           .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>                          single_chip_mlo_support),
>>       },
>> +    {
>> +        .data_type      = QMI_OPT_FLAG,
>> +        .elem_len       = 1,
>> +        .elem_size      = sizeof(u8),
>> +        .array_type     = NO_ARRAY,
>> +        .tlv_type       = 0x17,
>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>> +                       dynamic_ddr_support_valid),
>> +    },
>> +    {
>> +        .data_type      = QMI_UNSIGNED_1_BYTE,
>> +        .elem_len       = 1,
>> +        .elem_size      = sizeof(u8),
>> +        .array_type     = NO_ARRAY,
>> +        .tlv_type       = 0x17,
>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>> +                       dynamic_ddr_support),
>> +    },
>>       {
>>           .data_type    = QMI_EOTI,
>>           .array_type    = NO_ARRAY,
>> @@ -2248,6 +2284,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
>>       if (ret < 0)
>>           goto out;
>>   +    if (ab->qmi.dynamic_ddr_support) {
>> +        req.dynamic_mem_support_valid = 1;
>> +        req.dynamic_mem_support = 1;
>> +    }
>> +
>>       ret = qmi_txn_init(&ab->qmi.handle, &txn,
>>                  qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
>>       if (ret < 0)
>> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>>         ab->qmi.num_radios = resp.num_phy;
>>   +    if (resp.dynamic_ddr_support_valid)
>> +        ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
>> +
>>       ath12k_dbg(ab, ATH12K_DBG_QMI,
>> -           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
>> +           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %d dynamic_ddr_support %d\n",
>>              resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
>> -           resp.num_phy_valid, resp.num_phy,
>> -           resp.board_id_valid, resp.board_id);
>> +           resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
>> +           resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
>>         return;
>>   diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
>> index 2a63e214eb42..dbde76e5a78d 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.h
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
>> @@ -156,9 +156,10 @@ struct ath12k_qmi {
>>       struct m3_mem_region aux_uc_mem;
>>       unsigned int service_ins_id;
>>       struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
>> +    u8 dynamic_ddr_support;
>>   };
>>   -#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        261
>> +#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        265
>>   #define QMI_WLANFW_HOST_CAP_REQ_V01            0x0034
>>   #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN    7
>>   #define QMI_WLFW_HOST_CAP_RESP_V01            0x0034
>> @@ -258,7 +259,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
>>       struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>>       u8 feature_list_valid;
>>       u64 feature_list;
>> -
>> +    u8 dynamic_mem_support_valid;
>> +    u8 dynamic_mem_support;
>>   };
>>     struct qmi_wlanfw_host_cap_resp_msg_v01 {
>> @@ -267,7 +269,7 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>     #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN        0
>>   #define QMI_WLANFW_PHY_CAP_REQ_V01            0x0057
>> -#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        18
>> +#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        22
> 
> this is not used anywhere, but since you're touching it should this be 26 ? response TLV 7, num_phy 4, board_id 7, existing single_chip_mlo_support 4, and new dynamic_ddr_support 4
> 
> 
> -- 
> Ramesh

I checked the driver and found there are several unused QMI_*_RESP_MSG_LEN macros.
Since this macro is not used anywhere, I think it is better to remove this
change from the current patch.
I will send a separate cleanup patch to remove all unused QMI macros.

Hope that’s fine with you.

