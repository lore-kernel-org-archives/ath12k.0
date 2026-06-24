Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59810CDB47F
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgN2nBZRYrVFza8IUD/ZWGoBup4NDb6eH4d4Bf2TnRk=; b=HcdDq6YiMt3O+BEMddyRAiXbuV
	fhoNcooOxatmpM6mE4RUxV6VGicCwQMh4T4ea+zL9CFRHSoujL0MtVxVBNp2WioKfrypsC9K8EAQn
	cUomu5mO1F3JfcfJhuxwM3web4OXUq9Um35PCCjGiIDE4gKPb93iPCHXSWGgG2Jizo2P33ubPmlmJ
	iQeKMJ7Azzqm/SuHFTdAv0GZX6P5C4zqHQoeADht2kC5GA1HP+mFdL8HfDjRX89JjjAvgAcWm/67O
	33TKW4qoFx8VM7aFzlfcn2E77d4J3dKODQc/wg8Ah/Oa9EnItoPYWLuSx8oMAv0KJzrx77jPTsY0N
	tNc63SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJKa-00000007Qy6-0OtU;
	Wed, 24 Jun 2026 08:51:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJKX-00000007Qxb-1YoY
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 08:51:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5twk62237361
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 08:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgN2nBZRYrVFza8IUD/ZWGoBup4NDb6eH4d4Bf2TnRk=; b=GOPTW1TXY7phSwyY
	6POo2RRwTBeRaje2sJNMUY7fraCgtcqHGW0koWG04D1izIkXTtMTnEsjHmeydwsM
	F2pNXzVjUgJZkX87LviOx0e7BMgKS3i13na4u7AIm4BoupKKQk/aRUnjrjgU4qSN
	IZ6MT8a4x6tjOJkKpxE7WPg+S8Jm8UxzOBHiVyshFVFY0SYX7y9fccycjj9G98z+
	Y//qGebwGba6nFfjFpFed2iCD9mjTd08Xac900z+vykDYfv9kcKvTcQNj8n7HCdH
	XXxgAoFH4jQRcJZG3iI9C7fJfyaDJBrq3BQobXuEziZOaJrgPPcf9GG49mruf+FC
	LxN9Ng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p2a4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 08:51:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37de7fa80f5so284259a91.3
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291089; x=1782895889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgN2nBZRYrVFza8IUD/ZWGoBup4NDb6eH4d4Bf2TnRk=;
        b=kHzQ/ke8yoZChMW/MKt3yYCNd+7HA/a0zgQwNvyzfGQFsNdF6aJO4AWvDq6wTOtpua
         7QX+RYekDzudaIqf4PzS3YXyjqgif1Huh+R4PS+b8BhXUz2QA43haIL/xJiQQF9eFZsM
         WrQW6SWrcfpP6n1fG30faojNeZxTPfjb1Oepx08mxJvLEDsB9KLDOzugUku3flUViymI
         r7jMLATP45wHkowWyn2vdTJBkzYFLpJqMvAsmJWMlYLIUYOWDbyKpkHWMfCjU1vvSWlB
         oX/P9VbxKaksNuCSulteI/6QgBxnTOsEhD/7IQRWulgmlivDEk94T1/5wvxq2CDgyJcH
         GoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291089; x=1782895889;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgN2nBZRYrVFza8IUD/ZWGoBup4NDb6eH4d4Bf2TnRk=;
        b=qVVk1d8dog9hytQptgGKMA9qCUxXYsSCjcMRmI7gitDtR0jbaZTHM/DdzioHlBMhGo
         mFJlSQgK+52G4gRS4MaIPKlrBFCjM8Zt2H4adJO3wEILBDm0Znly1pax5I/aQgV4R9kK
         wHBDTxs8btBgcQTkm0QEI1rbP2ClSa0to00tjHjx9p5u5GJGkgAxqTAkqM9sLWhuazbY
         DjgEIuy6DOVUsoMtnCFYrbrCHzjRiTC2M6h7Dqo1r2Cnp7ZspGmjVmKTYkHWkcRf0GUJ
         gtiJnfZA1D+OjxbgYriS1dH2f9gVDQllExmmiZpw2YM5vahnWQhXB4DixrGVyr+VfOXd
         habg==
X-Forwarded-Encrypted: i=1; AHgh+RpBqPshSfvZiX6P7hV+/JhwFQDl6dwBgm3IaZf+kE4tQRvexq4+anAL4e5TQeHlzDu3TxASftM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaLrxGRMM4Pf2JaXKfvU3Z7J41+Fzrg4DMR8dJieedYF4QvJjs
	MiY6sf/mhIRKF+heRM3hnznnclvLBb0fKgkGkOJu4mv14GsglQKkUf6Ffm+7pmkrLvIYn+V/WhP
	ZfhQG6BRA02rHtQDtbmwEj+7I3dTJGEgA67IW7pJEcVEVnWZE2X18ScM0MILOoRS4
X-Gm-Gg: AfdE7cl2g4qaTSeCY22Lr+XV7Zv/NcieGpfJvQbuj9PN+7Wycn7M/sLkknORnG8jnC7
	F+wwlMSiPteJwSboZb/yeREYrWr/la0lcHHz2qG2ddof0r8e6efzIOyBjuCWNGoiEnJCqychCI1
	CUyrfulUBkDcX1lyQhdujz4uU0ENGkZMiWPXWhmfH6blYrZJ1A2LADvdrwXOoLtiiMMB7Rp8SMh
	/sAyibwFsdH4lUG4GciwvtePD2ALcdo734j01Br9/3/RfrxFy21eepe/LF/vrW/FrZFUlnyecl0
	khBM4AUOn2fVuQFaVq94vNP3NmRJAWLJQE6QU2Fjt/BjqRJy650V3BxH+ZYH3lkBn0VtyAzJOWE
	RZyypKnF+sdyi03FM9tvcGWtwjAPX9iL/GZC8X3hHlL0QtsuWFHIyoGykkw==
X-Received: by 2002:a17:90b:55d0:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-37d4d94047dmr19616659a91.10.1782291088953;
        Wed, 24 Jun 2026 01:51:28 -0700 (PDT)
X-Received: by 2002:a17:90b:55d0:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-37d4d94047dmr19616642a91.10.1782291088519;
        Wed, 24 Jun 2026 01:51:28 -0700 (PDT)
Received: from [192.168.106.30] ([157.50.13.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ba01f6sm2083429a91.15.2026.06.24.01.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:51:28 -0700 (PDT)
Message-ID: <6ec8de84-8f0a-4e88-bb1a-a7d45603fc2a@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:21:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix inconsistencies in struct
 qmi_elem_info initializers
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfX0jlSKeM0oIqr
 Ov1y7JS77PZB4yDE9OiwWjyMq+f13GeyL82kcZjD9spoOVgktZwFGKTh8kURrZ2QljbHhSQ7vcK
 OI9cA9Ra4L7lq9FMaF1DJ669r+MBtnA=
X-Proofpoint-ORIG-GUID: PCwUWcwiaNUjCqYgBTXtVFdE6VL7IlSW
X-Proofpoint-GUID: PCwUWcwiaNUjCqYgBTXtVFdE6VL7IlSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfXx7YUFkmDKzr3
 13H7aesMp692GansGTVedTHBh5sVgfpkw5l/6fJVXNaoj6UCqOItFix6S3SpMXqHZkVL8DyB+yW
 8Xuk7H9ocuG+SGc8Qe/tvXn4R8NAxEziipdqdu4h6NiwHHcmqqJgbguEUCwVTaBITjc5NbKlA1E
 rfe8wCrppp/W91CZ3Nsp+zcxgB15rL/QnrxWoiKKs66Ri6FtJsdFoLKamGbDqP4CsGvTEEO13Fx
 P7A5hoVZZBY0x1AzanRiXIUSkaMySPSCmQ7gW3FC7qZbWaPDrvUlKkk5zPs4r7rdZIeup97+ozF
 wtNOQy18S154SnrZAQmNNTk0Wc8YS5nYCX4gI8nXQWtunoRLPmL4qFLLuxfWViF9Uc9ujiSI+JZ
 gKVmHWF6Bhf+uN6pnf2kGOw8RYuR+g==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b9a91 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=DysFi5wBN3dAxe50r5uYmQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZoZKXFMULng3zEwbkoQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_015133_567568_61E7DCBD 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

On 6/23/2026 9:43 AM, Raj Kumar Bhagat wrote:
> Currently, the struct qmi_elem_info initializers in qmi.c are inconsistent
> in how they align the assignments, with tabs being used in the majority of
> places but spaces being used in some places. In those places replace the
> spaces with tabs for consistency.
> 
> Also fix incorrect and missing terminating records in the following
> qmi_elem_info initializers:
> - qmi_wlanfw_shadow_reg_cfg_s_v01_ei[]
> - qmi_wlanfw_mem_ready_ind_msg_v01_ei[]
> - qmi_wlanfw_fw_ready_ind_msg_v01_ei[]
> 
> Tested-on: Compile tested only.
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



