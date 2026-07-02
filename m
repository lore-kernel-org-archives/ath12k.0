Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE12C43602
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 07:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiMsynlwYPMX+3OLYL9rBoij/zRhgqJY9EBMCWUgwjk=; b=CwHX9qHkmGDb8DLbv5/E1Enrw3
	GfUSCUu2dfPLIX1J/z0dwL+sGHw7Xa2kDt79+BzGJL8z7/6pmNrWzQahWA0GQJoW7ZbANP+7j2Czy
	xgmRyvNvmMcx9LJ8b5kyBAEck4VN+jIIbFuTlWElSMDGNwx1oaYZLnr4+jbKFKi+DxxHqHVyWvVR3
	P2gXOR+vt3X/YF1Q54zpnF7DC3x0FE/d0RXQLMmvgqiLz+DZixN8nXWKyal92IMfY/mxAA55zHM9d
	2NgzdLTSQxBAszEn8g57tgHG4fMsy3dkwjzYNfDDkdG4jl7dO2IjLSQKadl+yETvhk2Dlpk7fBKrB
	xtGLnCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCKj-00000003n9L-24mz;
	Thu, 02 Jul 2026 07:59:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCKe-00000003n7h-2Vyk
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 07:59:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Kn1J2917937
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 07:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hiMsynlwYPMX+3OLYL9rBoij/zRhgqJY9EBMCWUgwjk=; b=Pqh7uXgDBxEX2Jka
	Z+Kz+BflEm36t1yTxBXoZEYyOLipFh2aMgQNR5HZlbPbOQG5Sn1UetVK94wfzzuD
	9ODR/4usPBbKb3jYiKoWwPqFDPfeei+D5iQUMT8/S25MOUF6G5hIbdaRyuK6sEcA
	VKHWG/oqCaRRtaRmkbfEuLgnQo/QDq996YgtMezRxqnejz5vH/LiMyRS4sm7/FAI
	v/O7X0xblvWxlhQYdX1goTmiIjlIEXwqe19dzjIxqTCR4yZxQCJwg/rZoPYcxplo
	9tw1HLfrJReq36mhiP6OZEI/2SPMuPXtopAs2wF8xp4BttdUGOSfaTu/G2RRqsS8
	9PEHrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0bsdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 07:59:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e17ec1940so1979917a91.0
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782979174; x=1783583974; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiMsynlwYPMX+3OLYL9rBoij/zRhgqJY9EBMCWUgwjk=;
        b=SFKdB4R0sr+fLfjyiGXNlpxn7S9nLspikTRh2EVC8lMdpdELj7X4x1AedGu5chEND0
         HAE1G6Hm07vHYYJTqjDj1zmZKRWwd7zYu6xRhjCgSwG7i+nxIKRFCCZsFJi9qC7mlDHe
         xtz9oLpKDa1yhGROVApHhFnH0h/oMcwAupKkvwG0/Mb6i+iqRFjv3OFlZOtxzg0BTG8G
         fCAvecJBVaMoipOnTkHW1LHxmOBnqJfBWTImRDHFd2IUXu4YhsxxyZF0X20vrXW4y4vk
         v8dlfu86fDdX+FMREj3z4ITXkveMX+GXbVtfi8acdW1ZJqSWcHL4fPc04AnfGN6qa3ZZ
         XI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979174; x=1783583974;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiMsynlwYPMX+3OLYL9rBoij/zRhgqJY9EBMCWUgwjk=;
        b=f9X6651faFKzlPkGHmmLZiyRiengOjqzUBSWq17XU/40Wre01erpBlfdEmsw+VXmuk
         GBOnsvEKAIKcGTRtVg4ESjDlglN3/KkC4615UNLxqTS3sMZ+C9C83LGey6chHWRpXj7a
         +PiyZenCihQ0d6Z9Y2Of50SdR4lxUYpLataUbdkxpyJe65gETzBbnd8KFjp7aP5uHIOx
         MpBrukTZiYhpIQhC+Ep7lLgiSKghx8GLfuXE4vvr8iOWoEazq/cPlyOQ9OK+7TSwY+1e
         gEFT3CMlgVtXGYuxESEbde+wJR2iLXODaP+r8e4kwsvAU79b2XpCavT5DUYIPeMd+FSF
         3/hg==
X-Forwarded-Encrypted: i=1; AHgh+RpjuTRPYdOsywH2fOyopb2xjr8DXzD0KTc23iYmZEHqVyfsCp8DSgO8q/ngCBEbEgfGOaZGvps=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFoRPyFG/b4Gv1bOnvhlfhtzI3HUioIdY1pHCEBMV+GwKd0biF
	lePbFeEtWriT0yN+20+Pg3FtkiHZ4vedKOldg7k3vtO0OssD07qazohljSfrJUTueMFzp9y3giw
	cdDKzaraTRgG8ghLCeW+5wQblbvC2Vtb5A3qEO4JnaLTppHDLwrPykWGi/RbxAfX8
X-Gm-Gg: AfdE7clfe43bLNw+AQ+URhSOIE5gzcsJBPtRFY6Zv0/TuIhUzmp47QyS/EQ9YJWQVgn
	m5hWVCnf01xU5rWkz1NzWj1VWQohvnigXa+wBXUEbpH2NPwPzFR1mRdpoqKw2TBDFzg5/+4hoSW
	CE8tEqw5zj36c6ZUkixurlo4+a7HbwhG+WF8pZdf8BVpKUZwDsi6I61Zx7qEt35Bi/NBCXZvEHh
	E7oyspUqmHzDN+9/A1aQUcMNLkgInJZYhdYx+A81ouMRJ/x61Kc1SzzidBFtYib0EsRvPKqd0Rv
	rfIehhOpsMtxTFJVY21EO6j9p4WruoMVjfNgS2vNRok1YxMf/FMVpo630LUYr8N8PLhpRkSwhXy
	WSnwQRIU/PQpiWbsmao6FZh4j1z158bNsIpxi3LZMhz5ytqwL7BCQ9iBOq4e0J8EWmR7NhEPTv9
	2o/MFqs60g
X-Received: by 2002:a17:90b:4b10:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-380aa1ee293mr4621017a91.26.1782979174324;
        Thu, 02 Jul 2026 00:59:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4b10:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-380aa1ee293mr4620985a91.26.1782979173650;
        Thu, 02 Jul 2026 00:59:33 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e1655b2asm599836a91.5.2026.07.02.00.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 00:59:33 -0700 (PDT)
Message-ID: <98748d59-1cc7-42d5-a90b-4d4793d0b157@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix SPT vaddr handling on big endian
 systems
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix-rx-tx-description-virtual-address-v1-1-ac1669eb43dd@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-fix-rx-tx-description-virtual-address-v1-1-ac1669eb43dd@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a461a67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=gTOcNWQQRDhoJBoYzwgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: vAPlq_iL6ALQf3rqI44LvdeG2Bjl1_Q7
X-Proofpoint-GUID: vAPlq_iL6ALQf3rqI44LvdeG2Bjl1_Q7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4MSBTYWx0ZWRfX6we+bIRi3XDi
 +USFvRAUSIWhl6xuO8A+4gK4pnU4Jc/2vy1vTyH3POxwg4pQArbk+vUh8k1/LHKjW4Gk8Hk8PLP
 0aiK7re324g/BL6amaWivgqSFl7TNirXynSslBfx44eNwSd1CiP2ifh+trMbf1mnyyaRLF7Z4It
 KYfHlZk7TYuu1Yi3K2LwGCu4dvyh6UKLyENfrvNPH/a6E9zGr4puPx292DdBjcoqVP860Y4J0VM
 th6E43OBn6yDlJGBMvsz2Xo4IdNjTjicJPra7ZBkBFg5k/eAKZNn+ppYeltUqRUjWIVQRiF8ck6
 La0wzKUDMW1IggHv8bmuEeGr9sRULSOb3l0tmWbVrE/sAK46WNW8H07CW0TNomNm7zhuN5KL2Bi
 Bs0TyoL53laYZRr+CHjvAjcsevRIT7IGgeNkUT7AiRB0e4SjT+GzQyJJlSiweuCtGOzllWL7n97
 Xy4OhphXmRj+Po/AMGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4MSBTYWx0ZWRfXxzfdTdFw9pry
 mFizWwtzehUURjaob3g78mTydGV7lmoCQPWxgHDF4yBgc3dgUPRd/PYORK66v9F0htZLUCY0XiX
 3xOXBaEWnMHIBqIeesVPInP23ctoTrI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_005936_660335_03C0100D 
X-CRM114-Status: GOOD (  10.36  )
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



On 6/29/2026 3:56 PM, Alexander Wilhelm wrote:
> SPT pages store descriptor addresses in their vaddr field as little endian
> 64 bit values. Treating these entries as native pointers produces invalid
> addresses on big endian systems.
> 
> Convert vaddr to __le64 and update all access paths. Write descriptor
> addresses as endian annotated 64 bit values and load them by converting
> back to native pointers. Return __le64* instead of void* from the SPT
> lookup and translate the stored value in the descriptor getters.
> 
> This ensures correct and consistent handling of descriptor addresses on big
> endian systems, while little endian systems remain unaffected.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


