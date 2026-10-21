Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C007606A319
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 05:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tr3xsDqG;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI2HMskx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieGxV1cd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=; b=Tr3xsDqGJM8RyFAwd6aZE0xp4+
	Mnk8SFFJ0qfByqMCJUIe0gv0NwEBY/287QzXDnHxpBCZDKoKsMLd56d3SZoajkbUnBH92WNpTPWs7
	6ft+y14Ifrz08h7p9jJTSzbFkjwc6QybddXUYq0l3FUMC4a+pmVQYOv/zwnMbu58JCNlTo/3br01p
	+ss5RoFbRhvpkqE2hJU1vxSOXYD+fbtn1ZRDCNFHdSWsEf+676Z/aUlQdgVpNig1+3YieVomfnDHf
	K8BEs+coch5401KRKM2uluQ0IWZBCCedgKB38/UL/joCDEnfcYPISdRSb9Ojwmp4ufLVub4wwEIqC
	VcXcE8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOrc-0000000B5mg-3jRB;
	Wed, 21 Oct 2026 05:27:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOrX-0000000B5lO-27Sq
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 05:27:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FD3D2392487
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 05:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=; b=pI2HMskxRT1GNUqj
	g7QTRwzmFvczF3NswYP5+FHFRSdqLbz/K7H76B5fnvwzT/fWtg89gynspxrg+MCL
	XCyRbZHcx/X1P4z6jBMY7ieN4Up9yH7zy9K3dkfJzQmMpuvpSUR6FRwFrzieX9IS
	A8YVCLpCsrunBsigynp7PlaTI7Nw4NMhvYAZo9ROuqhHTZcvOGVkYNb715PwdIGT
	dSkQ3+6zYhkkBC8gwMiprZZ7kgS2WUWUSbfxWqH2wykT6vWUkl8T0rYDFz48qO9f
	T/zbOPfRxuVN6r7G6G1vHNIIODkLLm9L3DTiOZ0zxV9JWRCEBVw0ExMGFn0LN7+c
	rySxtA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99wdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 05:27:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so2972245ad.3
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560462; x=1793165262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
        b=ieGxV1cdm2YFdeYziwtpWT/PDf9DVE7RBGA+GGLM7JYY6Lnz/8p3zRG0KFg3sUN2YZ
         j+xn8iZs9mTlPDIl8Y2wgdxP6XDl6qViSgh6t42652BvnGR0vDVgMcr8QtimcB5TK7cu
         78Ab9d09sygZEuPo5k7zMjGVtd2PXWAwWe5bPb62AHLYt8+IyPmz0K3vd50Ez/5/7/wa
         2O/K3TJ28YKt5w98jVrLslEr5p5B7UxfcTrHK8ZDa0KaDUosEovQ4xjxTH9ElL9ju4gL
         oNAR7pjgm6JSllJRIZqJxU91tsynLdOCo5W/qOyQcfCcClVET9zRt2qco/b5GOOFYKh/
         FRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560462; x=1793165262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
        b=2z0pLg8qeaanuQgO56iCStxuKwdUPf854UMEDZUQmQlGFF/FNhpuZZEKebLEWLwUrQ
         /kXAxByfbB2ojMbovNmhENpZmt6nfpQLrahWHIfwsCyIGPm+AnZxkVVBTfyE9FjLVud+
         FEWjNN6eF5Uch+7OP7A7WqvVbwsdyBoaSx+y2FOgno3zsEoW2LfOX1wAsSlbSINaCNWX
         mQsWV3Pg24r5G1sezmHtPdtYu8ihryf/wY9R2wHCunRAAuL0VkExerckdMdgN35vEbWv
         H5xtuXu2tngWJz6hrqDF1a1yAl/CZTjarXS/p0laAzHc5/zlIsr4iZZFjlf3lr/kJpVy
         TAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5AQk8PMxEDMlkOt1phHMu6NwOlPoHQiixSvQ4a35cczlbT0XM4HzulRBqgxVegYA9QkS9wZg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLeEgs61kJdI74RRulLzYcXMhnK4utq9fTrvlDR3uK4WIP9Du/y
	PB424t1F/DfSRELOEBWxlkZWs9BX1kcIe2i0F5x90mGpCnAswttq4E+WhXdNFBXcnhFA+CojZZH
	X9Uh7l0IcFX4tB8OWpQEUggnC0eCl4I/Xt/kWsTSOFM8DpcYoiONH95AMqzuYFB38
X-Gm-Gg: AYBFou3M5DRGeOunS3hHdnhELqyp6BHF2sWhdVZQO38zhV7T8bCvdqAo015b6M7ahyl
	J9PoxR67S5OvZ/fGksP57z3DYQwCcy3DlpU+6W/dBMEBTQid8miNvd7EOgmtZfdXMU23yTVMgn8
	hNMvaKpTIUxjgdopmzqpN46BZsdmtOV1d7OwNTsVpzMy7eKnZAKChqiBA9q8ISp+6kLy+9JZaZ+
	enpEB57MQ4i6cljvuujgGfMyfAp7iHXppJSCL0s1MDkH/DpfqhEmtzk920n/ikfvLNPhBoRKwfw
	zAiZubSJVEK1Az1fdLsSHviZd1KmMfEZwvNl+HJK7KhEEFQ+MCvB9CIOgLGHKkrnNdQOkP7WIhV
	Rqnq4RKucKD4mSVMyjYf1k/SUZm2OkRG71Q==
X-Received: by 2002:a17:903:228b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2ea43c62ce5mr8191845ad.34.1792560461623;
        Tue, 20 Oct 2026 22:27:41 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2ea43c62ce5mr8191605ad.34.1792560461167;
        Tue, 20 Oct 2026 22:27:41 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49caa7sm5949415ad.69.2026.10.20.22.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:27:39 -0700 (PDT)
Message-ID: <4dbdf8a9-8a91-4a95-9d53-b707666b28d4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:57:33 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
 <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfXzlS9Gu7+l+vD
 eoNurfsL89jV4Qw7ZRi9tsvkDTaYK/G/LTcrMKSDD2sy/i0OY/OcHiEMpklYYdMhOmveQaouy/3
 5d+Bz53C9CbLFQUR/J9CEarEUmG5biw=
X-Proofpoint-GUID: yxfHEC4cLxp2dKNHetT5_tIHtSsYXy7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX+3IjU1H4SOmy
 4T3PyvNb3eqP4xibqf0o4WPK7uXArcHDC1QWU3NM9xzsEgRrSbvxy+HawT1YX7jo8Hg/FvA115V
 kkj0I+lv4kvUO0VVe1lgxi5q7IkLrdMTvrTWIPQ26ZvAGVL7g1JP/x/nJEU45EN6h+VG2b+rF8/
 Fj4PESvBvD2qcHoDcZcQsm1BQuiie8nJOyGzeOTtw6qIh3zjU6Pwk4ND/GB4KF6hwiS8HjbgAdp
 o3h0nb0Ofaib5v5yfX360PFv5mA39+UNwh7tU44q+2Prkm2FumY/xv7Ue9IVoBmczRBD1lzXDMt
 6miMYim7bzvy07IRSDZ6IbvsQL7VsiT/JBDpABf/daL3Hi6ehnwCTWgGBBwLtY6Baw1S263cp7/
 SlITs1ugloQgdo+ELpv+PI1zw60xKMrFk02MZQCkIgWATIbK20w3zvSz8W739RGNlD1nTRJtjN6
 leoIMCrUdO2okecsm3Q==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad84d4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=86XGhZ5msFO19tOyMwMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: yxfHEC4cLxp2dKNHetT5_tIHtSsYXy7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_222743_662205_E31EA253 
X-CRM114-Status: GOOD (  13.87  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 10:31 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
> 
> Heh, unfortunately need to retract my review.
> 
> Filename must match compatible.
> 
> Best regards,
> Krzysztof
> 

Thanks for pointing this out. I'll update the filename to match the
compatible string and send the next version.

