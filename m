Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2562C5B572
	for <ath12k@archiver.kernel.org>; Mon, 17 Aug 2026 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9krNhIE3UBw/rESP2PBqxqCBjvhWUs/VVPKBV1N611M=; b=b/BnwIGUvIng+9K2KyOnrnVtKa
	LEOSBvmdjYsk9qxoPvZx+VLLQw0siBy236C1x3aFcBx3E6TC+sk8Oa5/D9ojYfcVo2B3KH/zw64GQ
	GvcyFYdXoISNszQ4tmGXCHpbsdHGj2wUdshVEctxcLdlIBOsea39cE5Owliiw/Y9byeXM0amt7NSd
	0WT9cH/f9jyQW9OVOIUN8LoqbOeUiJxicW/XL1GHKmTPw7xoYTX2jpOLa0lD5DClKWpiq/D9gNNml
	Ax8gtY+sSltcKnZQfX8+zb9eQKWBubwLJXjMPK8BQRhfmtoe4K9szFRfjG/mjVu2eY2k1+2++dHcL
	tdkkWoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvqYa-00000005ScD-1i6H;
	Mon, 17 Aug 2026 06:10:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvqYU-00000005Sbn-3wsb
	for ath12k@lists.infradead.org;
	Mon, 17 Aug 2026 06:10:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H5oF9W1328131
	for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 06:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9krNhIE3UBw/rESP2PBqxqCBjvhWUs/VVPKBV1N611M=; b=mA+HVcVvnnkABkbS
	Eb7IaTmmTjTwWQu1in9v54A72UN+iEm+fEGJ3xra5n4RZqL5B3EHNvhcJ2zEyPXX
	Qd4N5ZTIZEFEan2jFbeV2Tivcr2kWAYK5aVaWFPSEanwovF4g96txQiByTWGlrO/
	JNYNtLrHXjdorFqaFQ4OhWR5FZ/zfAkro8oWu0wJxydZTAS6hkZskpQhELm50Gal
	C4WNHRK/BbaFEurnEYpXiGvkePZ5yzVOtxhDhEoi+Eu0mrdXTUbEzFAkKNiFmUI1
	REIM1YGQAMGZr33VzuWgk97xrC1N/ivhr/t3amo6q8UUngXhNp3sADLm/0JKGT3M
	7opB5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghr1w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 06:10:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso4072810a91.2
        for <ath12k@lists.infradead.org>; Sun, 16 Aug 2026 23:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786947040; x=1787551840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9krNhIE3UBw/rESP2PBqxqCBjvhWUs/VVPKBV1N611M=;
        b=Yq9tqMcoKrH2b+bu16fdeZaLvJ5UxXYZigNQbD1h572Sc65WIE/NgbIvlk/ga7paP0
         yXhMr2nRLPAdYphMhutuxjeyRqyvZqrUJi3D9qVHYYILJmCWBU4lik3qCmVndxXfsbhd
         lz2ttYDGEIF8UxDypY1Seh4HrhSITxgHRU24TFJRm9EAvKzAcoKNerr/qDWOMdOt+7Sb
         GbrL6J84X0dnTGi7w0SVS8gNR+JeGW+A+LDnzkV2NKMiOu+Bxv3PHSO/gGZMQ9dopNeA
         wn/EiGB7FgghYW6E7+X2E7PYpblynMlRmxKIyaBvy4dmDLVjfRaA47elw8sXruQqowRO
         65Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786947040; x=1787551840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9krNhIE3UBw/rESP2PBqxqCBjvhWUs/VVPKBV1N611M=;
        b=KrvdD/Z21w8MgLGXvWz7tMXgZYf0/FAeF1+wq3q7448uspmolGuTGWl5cFRe68SGr8
         Ym+XUN0c5xP/bJ5d0wnJwUA/VBuw097TLDlKO0zV3tOynSJsofX3wQpZCk4kClcZfkWq
         YOgRPp9xfO62cXHI7ShvV9fNgFFCzcic6iBIB9ExxraaK8g5L4fK5bntRgLMlOnXlEkS
         Oz5wtvnnxRaKteAu0uAm8487jz5HT4ZVXgWc3EzsZDopRKc1OHoqxwApOr320eC8iou1
         u7JUiG4ngcB1EUNW/fbv0rrWq4G10JP5BWlZWx6xGfhDRl611V15mgh98xzPyLcWbZtE
         8KCA==
X-Forwarded-Encrypted: i=1; AHgh+RqRd9VTe63k47n4S98gupPgHeZluiBF6XnBYNYq9/TBkAWD0HavmmUJjh+VOL2RpVi++NsTjpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUXjb1lNB2LzlUuXCeWd01qMTy5M5WS1BmmJvRX6xheMz7UxuH
	/4kj+TY/97CSXHRndxLPiwjjbKQlyYHrFDv2zYyD5mzUQZk5PFO1BSqaEjwo873ZKb/g2ujKO3m
	vq6F5943f83jXESE8gfXi2nAyU420TcY2AnGotDRDYH5lugiA+AlNOmMrHxDhz4jV
X-Gm-Gg: AR+sD10RUOMQejHhF1YR9yeJMRznNQ3+zfT/iseZON585/D0X7y6jzP3+LkKadVKHo6
	4cRtV2kNo1ufXQbf1yjoqAfpTmAeVUF7phDEdPtvWLvYct0COo5VjIO8T9wVIbqeWptW+O2LxuM
	ts8+wJWZxhu/wvSnPcmX+otkjQytRAD4wbGcOeIemMJOndTG0bzKukVIYzt7nCOHeBi+/oP4I+S
	CYfay+6hSVgcVa8h+3EZNdgVwCDpyFgvnA6B+yQQYJY+sZVXUfIlbsY7vDDrc0cxWyH/t5pHJbr
	M+K33bEnNwanB3GUv48Lda68aB6NhpaGUbygCY3dq60yawl4bL6MJfUxzn8tyDhwMDYzbjgu11X
	vcSCDLCyqexVYccOmkcPjSyaPsvwIHxn8DQ==
X-Received: by 2002:a17:90b:224a:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-3933b786507mr22120896a91.3.1786947039582;
        Sun, 16 Aug 2026 23:10:39 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-3933b786507mr22120856a91.3.1786947039093;
        Sun, 16 Aug 2026 23:10:39 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb3c5sm3545712a91.9.2026.08.16.23.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 23:10:38 -0700 (PDT)
Message-ID: <17f92055-2605-471e-be27-ca0cde4c9830@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 11:40:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add support to load shared
 firmware on multiPD
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
 <30a72dbf-2872-489c-94eb-6d68828ec5e6@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <30a72dbf-2872-489c-94eb-6d68828ec5e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a82a5e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VBYNMMrA9GbHywMzlVQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA0NCBTYWx0ZWRfX6OnvZbHanWka
 N1PQM6bPGDDa5O1S9dVn9sa7pLL/AiAPLToiytuY9/f8LA8dl/AbCpJIYCIHhhuyB7UjPrtgjEx
 0EJxm1OfgB3T9EMK5jUxU1k+R0bUZ5U=
X-Proofpoint-ORIG-GUID: hjzH34O6ScjiKDhrbioZIjOA8deBXJF4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA0NCBTYWx0ZWRfX69KXpwYlIuja
 b4why/z1wK1den9i3gx/HIVyiu93R8SIKfm3VZOhrxXviv7PpkeFWSe95EEwDveNZ2dwphnAhG1
 bMdl2REacDkqdiIeMK4T6ACGOgiFbCSkEBmov8bgraU8A8K/Oz7Dw9FS0W53NpmvpIFwzAPsjZ2
 EsKXeokEAl++uITnkIBy/VdfUTJpx5vc8iXsIeg5MN3dcOYMj0CTmqK32/SyEkNJ8JBOG4DCPyR
 KTP5NjhKw0vFp2tVK5LiVIcR0j40Bt+Q0AkM2OpJ0mM5m2EOIpFeLc4whAiNmQFd8zLaJbrWzVe
 D4wlPUOVqJVlmJWzEtUIqm40L4X9erqS2+9qLk3SvDd9fmcIedtTxo7FEQFvSdImiygJwKkvbxm
 HMhWEpRUNHYdLtp54ZGodc/lIoCp397VCaf3/FfZPKYbamFbD62g7TE78PFGynyHyk7kSpNqIUM
 t8yQRU3pdmWb9OFhJGw==
X-Proofpoint-GUID: hjzH34O6ScjiKDhrbioZIjOA8deBXJF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_231043_101047_C867175A 
X-CRM114-Status: GOOD (  17.70  )
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



On 8/14/2026 11:54 PM, Jeff Johnson wrote:
> On 8/10/2026 10:43 PM, Aaradhana Sahu wrote:
>> +static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
>> +					  struct ath12k_ahb_rproc_info *rproc_info,
>> +					  const char *fw_name, u32 pasid)
>> +{
>> +	int ret;
>> +
>> +	const struct firmware *fw __free(firmware) = NULL;
>> +	ret = request_firmware(&fw, fw_name, ab->dev);
>> +	if (ret) {
>> +		ath12k_err(ab, "failed to request shared firmware %s: %d\n",
>> +			   fw_name, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!fw->size) {
>> +		ath12k_err(ab, "Invalid firmware size\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
>> +		   fw->size);
>> +
>> +	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
>> +			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
>> +	if (ret) {
>> +		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qcom_pas_auth_and_reset(pasid);
>> +	if (ret)
>> +		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
>> +			   ret);
> 
> my review agent says:
> qcom_mdt_load() calls qcom_scm_pas_init_image() and qcom_scm_pas_mem_setup()
> internally, which register the PASID with TrustZone. If that succeeds but the
> subsequent qcom_pas_auth_and_reset() fails, the PASID remains registered in
> SCM with no corresponding shutdown. The caller
> (ath12k_ahb_load_shared_firmware()) calls ath12k_ahb_put_fw_load_region() on
> this error path, but does not call qcom_pas_shutdown(). On the next probe or
> reset cycle, qcom_mdt_load() calls qcom_scm_pas_init_image() again on an
> already-registered PASID; SCM returns an error and firmware loading is
> permanently broken until a full platform reset.
> 
> and it suggest calling qcom_pas_shutdown(pasid)
> 
>         ret = qcom_pas_auth_and_reset(pasid);
>         if (ret) {
>                 ath12k_err(...);
>                 qcom_pas_shutdown(pasid);
>         }
>         return ret;
> 
> 

qcom_pas_mem_setup() is called by qcom_mdt_load() only when the firmware contains a QCOM_MDT_RELOCATABLE segment.
The firmware loaded through this path is non-relocatable, and reloc_base is passed as NULL, so qcom_pas_mem_setup()
is not invoked.

I have also verified the SCM behavior for our AHB firmware and confirmed that qcom_pas_shutdown() is not required
when qcom_pas_auth_and_reset() fails.

>> +	return ret;
>> +}
>> +


