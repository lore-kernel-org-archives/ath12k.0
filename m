Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D182CC83F34
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUNTvPJuu/i2Vx3d2jphL25/QF1mV2Ik44PvT95PjOY=; b=eVgC7eLX1KbD4wPScsKn52ETUr
	tvn5eIqLP8w1pa7qpUMPJcg/OMtIvXwJepvR6jvA0+krN+FTp5/hNXM+eVN2mgaTPMPalp84ZdSfc
	y1XYJbNjJVvFNHJ/xgZ3lTAKUeosusrm3jC3+PL9TVvruK21kDZl3tC2NGPqJnLOOYV9IHrFR7Dn+
	Nc4Ecgi78Jfuln1OGU9TpjonicAWEnMYw3wp3XPhXpWkzD/9FamKX+2ZE3XniEoHrf6E8kAvFR+U3
	oxx6AdrlR3NGOgstvw1aXoXe/0ySQ+L6QzRXutL5Wd1HK59jiN9kXVC99uICHzZ+4kOCMJ7Ya5dko
	YOiGBzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucWdc-0000000BC3X-2VxV;
	Thu, 17 Jul 2025 21:59:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucWdZ-0000000BC38-44gw
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 21:59:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HDAjlc021791
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 21:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUNTvPJuu/i2Vx3d2jphL25/QF1mV2Ik44PvT95PjOY=; b=Rlgs629YzdXRUgr8
	Hzm8iC670DPhHY5xKO5ppSW619Mk3lHCuwEMuUCtKVgfgLTOODJL3h6M7jyXP9S9
	FuxzUxNZen29wdwF3mZwk/AVNmVEY64cJ9TPDdU2s6Yc5HMvYnU3Q+GkHIWCLcHS
	jD6zyuWsRrTqFCdZoFpfzUxlB32ROS6L+yCxFRN4Ou0zWckeVSwmceUg/GivaenE
	85S+wehK8uweXWf8/teiIMgHf37UAcfGCfL7lPYB/uDB+3kZNPQz4xAd6PVQKHdJ
	mjhY0MX0pIyW+JAWN0BcuBgnSlAXr1wmrOYAzGG3x3zwB4kjd3KCrsZW4oORd9p+
	FSHVtw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8h4ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 21:59:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so1329578a91.3
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 14:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752789571; x=1753394371;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUNTvPJuu/i2Vx3d2jphL25/QF1mV2Ik44PvT95PjOY=;
        b=lNVFlE+thAMwPMpA/CUbFrdtCa9kOJMyQSr/dXwQLXbmHZ0hmNXtVaMcNneQdAgVYu
         UAaF39R4XXdi0XnH9Sb3uZ30GOsnZtdDAeM8G9dICaUjfGY7zDta4b4ZKZO0C57w7lDD
         Z+Nm4vMJdjjbA/q5O+/h6fj1SI/4voAXh+G7ZMFpV85gmojqu93hIuxzQzlOdbjv1zR8
         PgHGH0nVij8HkNT2o25ds//T5xChQ9vhvpHiQKk6ojEobfhP4j9pTOpF7VpdgdCs+UsT
         gC7qEYfTJ3itsY3OfQNHk4mtrWG0X/4tDSGiqQRo+Djho6IcnnZPaa4Qdbiu0MU0zwGV
         EQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTtue1aild0lV/ql3vOqoDzKCrDzI1leB8KGHLJbqeST6SX96qhooyLmMaDVmb4eUxXSoDNBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/jtHSqafHlq5hIUTAIRH9IEnghldcwMMEZBhxpO7pyqPRkgW
	Adoak8HFYTXEEBwvs7A30khVJ01adxnJ/sAsXF8CShNfpFSHGQLy79GddFQPImGhBzFDrTXeaan
	7d1mgb87OrzlQXbM7l/DtLqF3Briro7VVt9AWhT2J1fIxnqjjf4IY57GgMUxVSxaCivdM16ES
X-Gm-Gg: ASbGncs7Z9kVa1h00UfdbKlx0kwrQo2Mysh8ZBGY54nEk3euZ1W/zQCuCtCZ0Rw7YiZ
	u/VFuze5p83x3YsMb+GsE4a/GgBE90At+zE2QeV2b0O6lRYkNl+7MQnLMcOa2/BDEgI3197nAn8
	EjLDaTwK2a3ZOZwFDwxigal3IdLfEeqyL+7I4ZkfIl+4aTEDw5lD8Rm2RGkrpQfOq4+WTMPzzlU
	xVzT7ZfAht+FewTx5lfgLCwXipG8xNbmAeD7I4wov2f5t+0U+lxQBjSBlfKzCetcf/MIbfuyLLw
	z1/jXN5GtZ3kfXKYtVCpotv1e2gul6UWB3VfQANYArRioUOrvfz2e57dlTrSwCr0VVm1weGUVUI
	ONkqxDCI757JzHsPtLxBYW/JLF3kqvCHU
X-Received: by 2002:a17:90b:3f8d:b0:316:d69d:49fb with SMTP id 98e67ed59e1d1-31c9e70915amr13871111a91.14.1752789571341;
        Thu, 17 Jul 2025 14:59:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtT3W4j0tqng96kdhy60Rrx80aNci6ZjWm2VCYviqD/JRkQ8HjutQUDtFVn9IoVfXH3XN1jQ==
X-Received: by 2002:a17:90b:3f8d:b0:316:d69d:49fb with SMTP id 98e67ed59e1d1-31c9e70915amr13871086a91.14.1752789570941;
        Thu, 17 Jul 2025 14:59:30 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f309fsm1304095ad.223.2025.07.17.14.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:59:30 -0700 (PDT)
Message-ID: <e039d7e4-c23d-4b0b-9d97-533d00ef462f@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:59:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850: DFS broken since 176f3009ae598d0523b2
To: Mihai Moldovan <ionic@ionic.de>, ath12k@lists.infradead.org
References: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
 <047cc072-ed79-48cb-8869-fe72a5d7703c@oss.qualcomm.com>
 <0c1b3bf9-8e05-42da-87ff-673ef79a1e89@ionic.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c1b3bf9-8e05-42da-87ff-673ef79a1e89@ionic.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE5MyBTYWx0ZWRfXyW4Ot+BFrfLS
 0B75RF3eFklEUkFcMZ2qwc13n5H1Bb5V7jSyZ1DigroPj/XUZ+waf9x3VTjHDezxrD3dBpJfcla
 asVKtJdqPV6xR9wjlq41SW2HilwbIl333pDMYvq7kibP9z48bRJeo74EwjdU5EslnLH3FrK7785
 UN9tU1c1uyG462E9mH2eaT8oVQZ0wx9TJyjIwGVs8MbsPvhh22QeAZjLvMLy4YObR4h0x49cRMd
 8C9dVU2uYih8K9+a+2RfFrOzRaR3lx/1kOucCnrz6Ur440jcDrdVYZopYR3KJ05a7+As9ltd7WG
 LThsBhp0X8dtjkUqhNInS4pweHVVo4aGBcBVRqbqP9AfswitDR0rx71Plt4fHGVPpXx/eBEvxSM
 xbxKunhFh55cXRI/iitIdVjY5WbboYyiWPlAvCvrjX5UZTzpOGGVShwwdR0Tpnu9E9BHyNmE
X-Proofpoint-ORIG-GUID: uLZ8JwiXMYKTZ-4E3-zS17dbwqvIVm21
X-Proofpoint-GUID: uLZ8JwiXMYKTZ-4E3-zS17dbwqvIVm21
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68797244 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=8vInW6OOo4y35XVM8u0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=975 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_145934_136186_96B41DFD 
X-CRM114-Status: GOOD (  13.88  )
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

On 7/17/2025 2:09 PM, Mihai Moldovan wrote:
> * On 7/17/25 21:17, Jeff Johnson wrote:
>> Can you please open a ticket in Bugzilla so this can be tracked?
> 
> Thanks, done, with slightly amended content to point out that only beaconing 
> modes are affected (naturally): https://bugzilla.kernel.org/show_bug.cgi?id=220346
> 
> 
> While that technically is a regression, I wouldn't have called it as such or a 
> bug, because the breakage was deliberate according to the commit message. It 
> just struck me odd that nothing was done about this even three months after the 
> deliberate change - especially that there is no way to easily get back DFS 
> support in non-MLO setups.

Thanks for the report. I've notified the appropriate development team.

/jeff

