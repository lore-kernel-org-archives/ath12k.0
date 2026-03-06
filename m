Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FEBFCB619
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=; b=t4/DS7JgTEtrRVENx9j9kXDEB8
	v1ZcR/N4mY1rvtCLrMkSwABC3/vG24mzkCiEGKbJoQ2BMbUMjUSLQYRONvEvvNniIRy5S4U0onmnB
	qAii04vgUTZuvBtjlhpZzLaYa4UcQ5yWH+Kg3KCLXQ9KMt0B8TEWviPS0I0MJ+1brGjac7lIrrKEm
	tIl8J3uk9r7dkmHx/n2EAvczCFJw3xiZE+KHBD2KIwJtMbC3cj2TxhnvKeq09IV8HfrM5WdnmAaxv
	4VVdvPgMWgTy/WYE/Ef8xTcJSxTph6/EfXfYz8/JLNG3Ep421tKc7neGt8wI9pakCrGXm+nK/L0Gn
	GGCDQZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXHk-000000043Kg-0i8E;
	Fri, 06 Mar 2026 15:40:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXHh-000000043Jf-2VDH
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 15:40:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT0QD494430
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 15:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=; b=W3mV1Ri4C0Kr+8NY
	z48jIL/Lo5XCeSg8j7D2tMGiz+BixeS5WwAv+77z6Xtmt3pR8njgOFeAZk6HFWcR
	Oe0ZKlLov/jk7pnvYIKXwyH7MfJKbX0HuZ2GueDvAeOb6k9QaQmPqWmOKdAR59pn
	xQjhDSAc5fiGNCDUU7FsPAQh5WM+mj27lJKEClXszb72kWsUAoqrv4mtMbX+Efv/
	m17Hp96OLfYiwK9tX1eSetYWiKUrZXXbobABTIeAuNZmIx4touC45LQCSaHPVUyp
	yRgXXe4KghrLLTAyBzGs+Hpwb/FHWFSoJ1U6gIwIWeqQFSbJtg7+w8atgfY78i8S
	x/xrPg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9xr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 15:40:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so2922353eec.0
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 07:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772811609; x=1773416409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=;
        b=YBeHm09X2hdW41R+OKQbfkYhGWi4fHKRoR23oi48snBtx7ZrPTzMhBCNdvh3t/Eu+m
         s1IC/AHaawxlb+2zOyVBCWvdH1qd1BlPGWQqBOubTaIGpZCpqRIsYJNPQuzn1f1a3Vtx
         W5V2Iuk58f3EbbkU4Qnta8quHRyTuh8Qi4zb9bAAuokSIDEImQQriTaJZpmMIoRVPz78
         tlUfXX2k3ejcxHtAsA8OruCnx5B1x9ssvwKbHgl4eFNSeof7Doj1iw7+BPN4st24XNOh
         Qgfht4JK5PbYrC5H9Inb8S1X0p4KAGJV2bzCbjPYNjidS5UEutTcGx5KCipGsOVwz+/e
         sj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811609; x=1773416409;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=;
        b=dX8YB3VqcNJ7u0ZBJwgC1sUSBTMniFnuFpSAgxSLlY9bBEsi9lykh/RxsMmEr5IDRr
         f0Qlvqa7oDf9buSgJSD2STbPkaX5eFHHb9vMPMs6B1HUNBPTTfGGD7xBH+6OKbCn6SO1
         dpQVR3g8Ibzy1xPKeeJILv4w64em85u2YLnJ0htVrHtg7NSzLX8kBZs4mDEWfdKmDKLS
         bsT07OMYeHvhqbjNXs3QcTEaWmNNVye7gHLK7mbecM5RGzbEBdJ0JU/UTnqtxQHMVyae
         U8XA/6LaBbpKXbdcayh0L6QBIrlfc+qPdNmgGfSE8xGcKaT/vrF26n392yTRCaTkTOsM
         b5dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9RTnEAB9j4BrFlONK5Cs6en2Qhc2WCX1Cl1dCS5kcrTAflzzUZGoWX8AedaZzkzb1bsdf9uE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/c5bhgZceqmsRG+/vXIphKNUxh5wv6tsi0CJoVqN59WLCYP/9
	SJ/R1ZGHmwdMt4KBUqCcCMAdIwgbsVQlA29d7Ramajqm0KgzO2EXHIrOWDsMQ4NZmWuW7sAtpqa
	63rnbRyKeefebTSy5uexzQLW853zCM3U4Xq6Cm1t7BO6fXHzSsIgEBHsPxBP/t+yw
X-Gm-Gg: ATEYQzx3G8PMmi7J2RwS4w8/x3Db9mxBgz0lCBAtcKXglmZn4wOFqK5Bades3tIFCry
	4Gq+2+j7flm+7Fe3GAijy+AIfVylx2T36w6jq2sQJ9p9LrseEoFzPend0AWcchuDHGXKiDNJSM1
	e+522ai8QHtOX987fMMjoyXj4fvo/WjnXYak2YaLzg/KDAcCTkhp0DhhKpMIi+CtpjwVcM48Gcb
	i7CxbLwpcDjnI6dp5EVeFAW9zZVlB64A0h2lqh4syoIqhHvwdw8rJxRvVYgZXRoXGUcz+1SHIiJ
	zfdFWY93D+zSVLxr9oKX2gyUJ+KL2/iD2PL8KW+x5unW6GXn7+xCcokxEN3/2KzrGTFfftebelj
	zabAKizzuDlTMONOlRXDGa1JKZiWXO3JHCAvsYb1hf+6TqjkkLXzNuB4pRPWQ+vnOvwy0XPLm3U
	x/RkwIKNHjRSsROA==
X-Received: by 2002:a05:7300:ec07:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2be4e56f9f9mr928810eec.1.1772811609171;
        Fri, 06 Mar 2026 07:40:09 -0800 (PST)
X-Received: by 2002:a05:7300:ec07:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2be4e56f9f9mr928768eec.1.1772811608557;
        Fri, 06 Mar 2026 07:40:08 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94833bsm1356612eec.18.2026.03.06.07.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:40:08 -0800 (PST)
Message-ID: <9741588f-e6a1-4749-970b-3ed814399a32@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:40:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX4hCc2EwbvtIb
 zpPD81k9R8WiuashvTNE5twZCb4ShaazbG5s3YyDwkqjYCsjYDqpiMzSfTIWH9MIphcS1jWB1bs
 m590l1BAFDUagNuHXwn8z/twzx7RgbiQTZHBKhgw0TIc8Vlic7gWfW1dr6ZN0+PL4XizlF5Oe26
 kA5mmdGqwvaqMlXiwtyKnhc4RE1v0r8+/98M9v+C+EoJiB6ZYdnEBUOZyJ5DoYe8XT4PJbPVvIK
 wFYRLsQcEiLhUpisUQKGhgFN3C6eSGCY+kYhTsyZlDBBOZyHoDEoF2H0mJ1C1S/qp/qpP7W9TEO
 nxUScz4jK5juqQ4kNFFKKNCLnaVvWiqbhDljWpd4kV/GvSJHlTRmjX3EQzNWjLuS3+Y3VjbN52c
 UjIakMqNme2NPs2EP/Wvd3gtYWg6dIMMKbqhZyoZgmTKpLhNTyzIfKG7ceCrNBxSD9igi5Dm6fx
 qvnQ34hiqSQ9UJbpKpA==
X-Proofpoint-ORIG-GUID: -mezVqDQsIqU4rvOyRgtCz9EkOtWZdIA
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aaf55a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=40pWYZonmZhD7659SdoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: -mezVqDQsIqU4rvOyRgtCz9EkOtWZdIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074013_780855_DCC341F6 
X-CRM114-Status: GOOD (  18.04  )
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

On 3/6/2026 2:50 AM, Sumit Garg wrote:
>  drivers/firmware/qcom/Kconfig          |   8 +
>  drivers/firmware/qcom/Makefile         |   1 +
>  drivers/firmware/qcom/qcom_pas.c       | 295 +++++++++++++++++++++++++

kernel-doc is throwing some warnings in this file which I've listed below.
kernel-doc is also throwing warnings in some of the other files touched by
this series, but since those are presumably preexisting I didn't bother to
mention them. Just want to avoid adding new warnings.

>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>  5 files changed, 398 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
...
> +/**
> + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> + *			  for firmware loading
> + * @pas_id:	peripheral authentication service id
> + * @addr:	start address of memory area to prepare
> + * @size:	size of the memory area to prepare
> + *
> + * Returns 0 on success.

kernel-doc complains:
Warning: drivers/firmware/qcom/qcom_pas.c:103 No description found for return
value of 'qcom_pas_mem_setup'

should use the kernel-doc Return: tag

 * Return: 0 on success

(Returns: is also accepted although not documented)

> + */
...
> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.

hmmm, kernel-doc didn't complain about this one so the script must accept
'Return' without the ":" (but not 'Returns' without the ":").

Suggest changing to Return: to be conformant with the actual documentation:
<https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation>

> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
...
> +/**
> + * qcom_pas_set_remote_state() - Set the remote processor state
> + * @state:	peripheral state
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns 0 on success.

Warning: drivers/firmware/qcom/qcom_pas.c:217 No description found for return
value of 'qcom_pas_set_remote_state'

> + */
...
> +/**
> + * qcom_pas_shutdown() - Shut down the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns 0 on success.

Warning: drivers/firmware/qcom/qcom_pas.c:232 No description found for return
value of 'qcom_pas_shutdown'

> + */
...
> +/**
> + * qcom_pas_supported() - Check if the peripheral authentication service is
> + *			  available for the given peripheral
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns true if PAS is supported for this peripheral, otherwise false.

Warning: drivers/firmware/qcom/qcom_pas.c:248 No description found for return
value of 'qcom_pas_supported'

> + */
...
> +/**
> + * qcom_pas_is_available() - Check for PAS service
> + *
> + * Returns true on success.

Warning: drivers/firmware/qcom/qcom_pas.c:262 No description found for return
value of 'qcom_pas_is_available'

> + */

