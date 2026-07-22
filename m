Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A3DC44532
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=; b=dJLa1fNrF2rlTIjVusof6wxQoz
	/CXJxKBL9c/y2sZ7/Hs6dv1W3nDM4esY27d31vb1kX8roq5MVK3ngE5mhY5836n1JWp8XQNuNz/Mk
	5RSg+ODy+WsWRZEC4wtrQtw3xAzWqKvMyn26OEBWxPmCbCLb7afpETvI/E+q5lupIyYNyQblnTRMz
	Nc3OYGBMmwdtMSFFQ85DoBSkBK7zbEg9xihj8PxzoAYSFq+lZT9Cyarc5DC5BjlCcSgK+bBD5gnTq
	ZmCgBsCLwcgFkDkIh2kg6IXyoBl7HXowrodPfWDXbCBMz98t3qtFVQuOm3I9AFEfcY/MrxQxJ5uow
	1wNG6qLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEZ-0000000CG5X-3N4t;
	Wed, 22 Jul 2026 15:51:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEW-0000000CG3e-1Aio
	for ath12k@lists.infradead.org;
	Wed, 22 Jul 2026 15:51:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFYAvW1044051
	for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 15:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=; b=UXD4in6lEx65asPm
	4IOzpayhTLQ0PJAfzip4L2A1hYHhdMy+4AXS34TJkQr1ptkgob8lqPuPFd0IBa0G
	Awf0peLgEYF9hncGxu8Tx+vggFPcE7rK8w6eYxthHV2+vQFPfREC9L6o4GlUmUne
	Wy6aCMkCXk8c8XEjf6D4wasmul7r4duMeFmpJPZgv6DyLQPxi92eUcddLrL1+ZHs
	rJ8NkgleV8u76dlkzHo4ko4ubT2uD2F8mRjp2+Kik5eKBQtu0VguAGVxlW7rbKVj
	1wssL+hD0alBP8JS5A40Z0YkERo94/7ugJa57xOr5GgEAvT5b+skLXT/9zBto2cn
	FnySQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4u0k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 15:51:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso3446677a12.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784735503; x=1785340303; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=;
        b=LNsvCRWnqkLlzoABupysrSQXl0O+9tN1gQgOSpV4opYj7AEkS43iLXP2Zzl6POz640
         rBWIRntbLX/UR/sCxTbjJ+3wIuT+53PUQafk2+I6hQx+LEPpMz3pK3a5d+/nIaJaG0ot
         AclYlVbqXo28fa91T2zC9K0rgk2LLP94tdYbiN7csXuI2E4zMZHs6ikUSIWIiSEvBrqO
         Zs8ElcmZT9MZDFvNrBx424mPmSzJwcTyTSCTQkszbHuT72l9Z2kMHsxd8oVcc+IZRlPO
         qh+VKaOK0+5LOhrbw6DFC702z4HFmw3ojOLE4Evnr/o9DMNTM5zK++8D06VOGSpzc0Zc
         T3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784735503; x=1785340303;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOS8C9O2mpDSWwcI2U+Die3+r9YuIRHaNSGUW96C7PU=;
        b=fYoVy4Il3Mp0xzscXCX5ymhfqCyZOSciQlBUDj2iYL4q+iXPMXQI6216+QwEJyP9IO
         2/k8q0RestWnPFRlEE3fFFrioIsu84SQo3GgnHRd+FesK86DtBjl7t6eYTYj7Jc9AvOx
         tlwizMO6T71cRq92tizRZ31EkEvurDR9DJJJpz5W0xgs8BknNjLKKMKirir08IPfYHP0
         5jBxe9M515micVNhepj8hLHeYOsCE688UJgmHNfR9znWppQeDgIcua3t++mCmhdfIq8p
         r2OBcIlok41lgrCmPu9nGfHNROm+jFRCNBXvy/MdpRKkrik1iZAhJNUaaf2apy57Jwsc
         5x9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDAHy6uB+Ny9aQ0uSbNotBJfakURYTFVBX3J2M3+w+HxXw0Ls9nfE6VrdUIMlc/ArKgGBKxF4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiLP6iarl7WoFMhYrw5PJQZr4mehNwt2EkWahubO7KVXH/U4QT
	WfZ3EOVLHFW45mQd850BBwvFWlfg6+1+1gq0JiP+moo3pDXJpgIBit9GbNi+CNyp+4hQTBaHPq7
	SmYFChHumoARW5f7zHJAbIv6QrjZiTpHJzNmNHNE+rutHEn9Q5X0wQEMIRhWYx1hL
X-Gm-Gg: AR+sD10vSIcgHAFrmP840fKNNFwgZgRnp3P4I9Fb5qNu1b183OAdlZ3DA9G77JJmYg2
	D+xw60bVV3c7GJk+8KTZHCZ/SHUeJDJub3yIt7SsUYYPG3f3sifg1QBWq72YYeUoFPWB0AILjK4
	v74PTyJVDhj7kAle/cdJwzc6430cWSt0eNXTgF99cCpPSL916jf8qTu2FDOEQjtZGAYf4Vxyl/6
	yccMAPeOTvkD9R2dh3av3byvROXDB2bEOwc/7rJiEqnsjueXDwwtpveVprhrKUvcs65De0bkIbF
	MEHW4PQgRDBZcin7Vfsf0OrqjXZEe9Es7G4b+QUzuDvGt7bFC/7uj1oO/X+9qCGbpa5TZaqjtiC
	Mo/6KdL3He/sN5ZiLG9ZuaA4ud0DmGj/v7c6cDwJ8F9Su1Zp9mlxp4z6mfq8n
X-Received: by 2002:a05:6a20:2d07:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c431120182mr4018436637.1.1784735502579;
        Wed, 22 Jul 2026 08:51:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d07:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c431120182mr4018400637.1.1784735502119;
        Wed, 22 Jul 2026 08:51:42 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm10913111eec.25.2026.07.22.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 08:51:41 -0700 (PDT)
Message-ID: <0833afbd-4a25-4e7d-8e77-ab9fac9d36cf@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:51:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20260721
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
 <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k_xnegvKmlMww3B8zt2t2mBAiOU_6eLb
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60e70f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=XsDMgvtJpxJmlFumrWkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1NiBTYWx0ZWRfX7cmRFZNfBPfd
 Z4iocLbw39toHXbXiwmolqclkC4sWYTfPPYfF9FXunag05RuAbbqAtrJNq9bTgK7DzdAbBMjHH/
 P+BzidGseTt05TmQDyh2oAOcyd4lJvdKNWziTm+lwuFuox1cwUHF9RAc/9fwE+66PiUikPuuH+n
 pCrXigyA2lpsVZWo6DSn/Y97d6Vo9Dte/qkyB7bVgn4XZ2N4wBWs1LUUcLvZEpJaNkzbYPYtfMy
 BbT404HBXdZ8gchLTPEtoE24cQ15eFRo5Q5cDD5zDSUX6VxjN+/oHp6+IAH/TqY0LTQ9ftQLnWg
 q+87zEOTPPckd9n0wV6vDdvipOU1DcrR6DJ35NxJlkPe4kkjk4FyElQz9QDvdZ+6OCdMbNDpf+u
 b4+sfMVOX0dQebinyIyQO3Nj76cjTXtQlrtS1oz/f3HVUxjbIQ/+14a5XDftAJGEN/ySuX6BZnX
 gUwqCR9bUOQa2gTFc0A==
X-Proofpoint-ORIG-GUID: k_xnegvKmlMww3B8zt2t2mBAiOU_6eLb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1NiBTYWx0ZWRfXwfxKOG4kkHkY
 OhFyThXj6GbrNCPJwjYkKTGh0Ohv+j+tzcPsgOOAssZy1HEa0HeeEVc/cZg9ORs1UCy05mXzMz4
 sC31FIiUE8Y00dvcyMpJ6JTbio9K/OQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_085144_342060_85687E25 
X-CRM114-Status: GOOD (  18.13  )
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

On 7/22/2026 7:08 AM, Johannes Berg wrote:
> On Tue, 2026-07-21 at 16:46 -0700, Jeff Johnson wrote:
>>
>> ----------------------------------------------------------------
>>
>> NOTE TO UPSTREAM MAINTAINERS
>> This PR includes the merge of an immutable branch from the qcom tree
>> https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.b4-ty@kernel.org/
> 
> That's annoying, it added a kernel-doc warning that now shows up on our
> output... I guess we need to ignore that.
> 
>> New warnings added:
>> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
>> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
>> Per-file breakdown:
>>      2 drivers/firmware/qcom/qcom_scm.c

:(

I run kernel-doc on the patches I process, but since I didn't directly process
that series I didn't see it.

Bjorn/Sumit: looks like there are a lot of those that need cleaning up...
% scripts/kernel-doc -Wall -Werror -none drivers/firmware/qcom/qcom_scm.c
Warning: drivers/firmware/qcom/qcom_scm.c:317 No description found for return value of 'qcom_scm_call'
Warning: drivers/firmware/qcom/qcom_scm.c:343 No description found for return value of 'qcom_scm_call_atomic'
Warning: drivers/firmware/qcom/qcom_scm.c:440 No description found for return value of 'qcom_scm_set_warm_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:453 No description found for return value of 'qcom_scm_set_cold_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1147 No description found for return value of 'qcom_scm_restore_sec_cfg_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1325 No description found for return value of 'qcom_scm_assign_mem'
Warning: drivers/firmware/qcom/qcom_scm.c:1396 No description found for return value of 'qcom_scm_ocmem_lock_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1413 No description found for return value of 'qcom_scm_ocmem_lock'
Warning: drivers/firmware/qcom/qcom_scm.c:1437 No description found for return value of 'qcom_scm_ocmem_unlock'
Warning: drivers/firmware/qcom/qcom_scm.c:1767 No description found for return value of 'qcom_scm_hdcp_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1792 No description found for return value of 'qcom_scm_hdcp_req'
Warning: drivers/firmware/qcom/qcom_scm.c:2526 No description found for return value of 'qcom_scm_is_available'
Warning: drivers/firmware/qcom/qcom_scm.c:317 No description found for return value of 'qcom_scm_call'
Warning: drivers/firmware/qcom/qcom_scm.c:343 No description found for return value of 'qcom_scm_call_atomic'
Warning: drivers/firmware/qcom/qcom_scm.c:440 No description found for return value of 'qcom_scm_set_warm_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:453 No description found for return value of 'qcom_scm_set_cold_boot_addr'
Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for return value of 'qcom_scm_is_pas_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1147 No description found for return value of 'qcom_scm_restore_sec_cfg_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1325 No description found for return value of 'qcom_scm_assign_mem'
Warning: drivers/firmware/qcom/qcom_scm.c:1396 No description found for return value of 'qcom_scm_ocmem_lock_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1413 No description found for return value of 'qcom_scm_ocmem_lock'
Warning: drivers/firmware/qcom/qcom_scm.c:1437 No description found for return value of 'qcom_scm_ocmem_unlock'
Warning: drivers/firmware/qcom/qcom_scm.c:1767 No description found for return value of 'qcom_scm_hdcp_available'
Warning: drivers/firmware/qcom/qcom_scm.c:1792 No description found for return value of 'qcom_scm_hdcp_req'
Warning: drivers/firmware/qcom/qcom_scm.c:2526 No description found for return value of 'qcom_scm_is_available'
26 warnings as errors

> 
> I also get two fixes tag reports:
> 
>> Commit: b127f79a4933 ("wifi: ath12k: Correctly copy the hint BSSID in WMI scan request")
>> 	Fixes tag: Fixes: f40abb4788a2 ("ath12k: New driver for Qualcomm 11be hw family")
>> 	Has these problem(s):
>> 		- Target SHA1 does not exist
>> Commit: fde37c064641 ("wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param")
>> 	Fixes tag: Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")
>> 	Has these problem(s):
>> 		- empty lines surround the Fixes tag
> 
> Note that the first of those ... the commit exists, but not in the right
> tree. It's in some ath12k-bringup-start tag in your tree, but not in
> mainline, got a different sha1 there. So checking locally is confusing.

Let me rewrite those and send another PR

> 
> johannes


