Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502B3D0EE0A
	for <ath12k@archiver.kernel.org>; Tue, 25 Nov 2025 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owFn4+22Dt9h0dvI5JhAaFVHZpEFy+gIYCPbJTU02SE=; b=0osiX4egX9a9GQ4fWJoLqY5626
	hzfvxJBAY8S6yDblWIx3B0OzRZoc67k0m70hUOlWPH96PjJauTfrnvRKITfVti/wvDe+MsTXPENnh
	IoLAItowJEDwugepJRkYMfZSNQz5Gt4MxkLjCAfEBdb4aOhnwm0JvakeEUixxV3RoaVT5gBOUjmew
	4KpRB2uaHkl//NYMa6a0cbt1L9FVLISOp70BYuQ1Omzj6XOgKQkPeCdtPWcyMyGRTWiEE2EJ+cdHM
	ZYLO3rbp+x9ZS+vj6kSy85JM+9SOqWAJL4q1zJjD1XMXTq6Zjtbcllnjye1vlM6eDdAR1JdXXi/jU
	nKlEmZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwD2-0000000DcHe-0J87;
	Tue, 25 Nov 2025 16:48:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwCz-0000000DcGp-1zMR
	for ath12k@lists.infradead.org;
	Tue, 25 Nov 2025 16:48:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APFxx0l2655501
	for <ath12k@lists.infradead.org>; Tue, 25 Nov 2025 16:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owFn4+22Dt9h0dvI5JhAaFVHZpEFy+gIYCPbJTU02SE=; b=NkyrtaWKHf3BksNV
	co4/ZHHxJhVoEF38sLym/5hqSiUzlEvODNp1Htw0MyKx51h6lriWRYpdBaNEA9qw
	qfAPLZDkTcLFO00YMIH0tIMpdSyrkTxBQAAc66UZ+9SvkA66g0+Hlmg5F5CVOac4
	5bwA9HAMGUrTmK4xG5HdZM6gGdOzReCNKyUrldKOkFMgz5O277T5Vqo0K1ZEjHvF
	OZfMJSSk03Cn0ha/HI52HePRwh84J7R3/QhqJ6cMVyxVrylbjdEQ+sNv4uPpsRxb
	+x2OIswkstWjmFDvPLSRPD63e1DcGNxoh+YaKvth9MM9Fg4lLJ0OIB3WngbfZyIX
	DqJUHg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxse17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Nov 2025 16:48:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so5882674b3a.2
        for <ath12k@lists.infradead.org>; Tue, 25 Nov 2025 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764089284; x=1764694084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owFn4+22Dt9h0dvI5JhAaFVHZpEFy+gIYCPbJTU02SE=;
        b=Utee61wNywwfFhBJvjgGuSGOWMqrm86DHiu/DaoVBESjBjUdnam7CdgO0L1uiiMxBr
         2NPUzkGO6XuPcYwindOgrTr3urzRyEoLvje8nQIdMsaJ3gzrcnwxDZ996JYSr+RlbDm+
         3tyOtOkaGSLPLEE1UaCeqEGZOd/eogTSYfeZq0bwvjC7LTzAC7QJR/u7YR2m8g/72Gl8
         QSmqInXyGLT3Dw+vWmkHeuLZ1g2JzmhQ4ODG9wTumHn3hPcYZ2vmKdmV0dbk9jtPlFFp
         VCFzkIuQ8uI2fmgV2AdQgm79lCvZKAVopTOdBEI0j3Nv0GasLvdNS0W738f/6fUyV4fy
         EWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089284; x=1764694084;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owFn4+22Dt9h0dvI5JhAaFVHZpEFy+gIYCPbJTU02SE=;
        b=T+dlhj67fmVQH3c/O+SCSFCjHOms5ahZHTZqzPp6CqfSlmEin+Enu6jZcQTg4V7OOY
         jdpDPmI4xk1SCd1LU2vX4W0I7PzGhPlabCbLhmAFkMMPBvXjTkNAsME2HhHtNk0tcsem
         XGkEx9Zhkrq5CZDsgiUWuFgnJNQFEpgdR0PCf/7JLN8lxeuO1nagxQfmc0FRf3pOgtC/
         eoY1xbZ8aPSz4F+6gM4eZ/8lCN7TFiL9NwJW1p/vIrIv21/lx34LbZ240DoQcC3xp588
         vJvpqO15DUtS02REi6JbP/ncg9UfWm6xABtf0ow6DH5EkTMLGGtWKaeuzJ4AOi3emrci
         ET8g==
X-Forwarded-Encrypted: i=1; AJvYcCUFnNFDWNoy456ZgVSqf5UzYeYwXrcuUSwRZTsoY5++r++Qmo+x+eVbhC6KtXDAZco84XMiVhA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAMAK5qbfpx++NgOnH6HI1M04P7/LggvAkCUn4nRelyvf63PN8
	rz47nVO6q9rstnDSrkmOIhSPIZti2XZGgaVaF/sLanhkFZQyjgjWVLK0hDQuzN5Gk8AzxBgCx1+
	XrUW6gvqtYj/hw/uY/VBBpmOXTUHS4OLF48dDlNpvfnJhHUynpYE4bhCwnLLSs4w7LUQfQnmo
X-Gm-Gg: ASbGnct1PiXshbc7rHNUlNSOEJ+2UaFmzyYOO5coaMBvHxnPgIhVujiLPXQkVUo26dl
	Ryd1FyhkEmrYhfX83EfwAxx0dDXkVy7c+EPrORmsYCVS3yta7w7s0XRmgq/5AdgDVb3nXBLgMfv
	pMUZ/34y93caegZo3YrfhmuFwyouVX2EtZS0df9k7DqyarCDAMW65Bx+mFw/3MGrs/70Lo1JMng
	aXSG3bGlBn3/IFCV7clPBCGk1eJU365dHcXidyUPa77BfruiyN2U10nVqby2ndn5pgiYo3op+jf
	dqSwfL11T8/LIWHmukSTLzghynXrdhH4PcPg5/qnlfgyC8jwdJYMZDeax0QoNnAv545ucoUxqvx
	q+iKYOugCjEJc62Xt9ZDLvXpbtqY7yW650+yerE8NIfAdPRTFLCWgVJC9eJDPZCAdhNB8qA==
X-Received: by 2002:a05:6a21:3399:b0:34f:ec32:6a4b with SMTP id adf61e73a8af0-36150ef8195mr16032888637.32.1764089283758;
        Tue, 25 Nov 2025 08:48:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPShcOIsEaNc3uW4NqPkq5KubUsXBKSz0C3elunNAPNo63sqiGW9+gfV1cqdAWum0P0h9A5Q==
X-Received: by 2002:a05:6a21:3399:b0:34f:ec32:6a4b with SMTP id adf61e73a8af0-36150ef8195mr16032862637.32.1764089283269;
        Tue, 25 Nov 2025 08:48:03 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d55b71sm18841191b3a.55.2025.11.25.08.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 08:48:02 -0800 (PST)
Message-ID: <9627ce3e-9744-4250-9e6b-708771343c89@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 08:48:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] wireless-2025-11-20
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20251120085433.8601-3-johannes@sipsolutions.net>
 <69b2d01e-38f3-4a6a-a7e6-5d94d42fe65a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <69b2d01e-38f3-4a6a-a7e6-5d94d42fe65a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6925ddc4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9x0bo0beFLz6AYJxxT0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0MCBTYWx0ZWRfXxKetJ6FkXaOj
 UtrfZHdITEOhH6FGynJdlkOMF+u5Lav8RA79HeGJzqfzPWlY5Vv2Ye9ISwr1wS0hJy7lgggaJfp
 kpj/6kyihV412uvwkJ9b59Ajq+KSb1BSfhlz31v3WTNy1KsX/a/m73gwOrq39caIBK/wE9UVDf/
 IBSPHU0r2x+GxhO1th0y5SGUrRkTpnDfnxS5SGEUIFfv4AJuqrHxYvchN1iDWZD116JO0mLFYqt
 IRbKNW4EyrClgvgKxVDgsGqOM2Ptl+1T/5urdMKBfGfUsDuOLH8xWv391uQgRVD/m/VrDBzfgHb
 CIp/SJ0cg1UMJdAJJDjusPT3jUHlJLQGiO3vIbJSA==
X-Proofpoint-ORIG-GUID: 1EdAcFwH4eSPLH4j8fbC-ExMjdo8Y8rP
X-Proofpoint-GUID: 1EdAcFwH4eSPLH4j8fbC-ExMjdo8Y8rP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_084805_531680_D0852625 
X-CRM114-Status: GOOD (  12.53  )
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

On 11/20/2025 10:05 AM, Jeff Johnson wrote:
> On 11/20/2025 12:53 AM, Johannes Berg wrote:
>> Hi,
>>
>> Looks like things are quieting down, I fear maybe _too_ quiet
>> since we only have a single fix for rtw89 scanning.
> 
> Isn't that the way it is supposed to be heading into -rc7?
> :)
> 
> BTW internally we're finalizing the ath12k-ng => ath-next merge.
> It's a non-trivial merge of around 100 patches on top of around 60 patches
> since the branch point.
> 
> Current goal is get it to you next week for the v6.19 merge window.

Update: We are still validating the merged code and hence we will not be
issuing a pull request for v6.19 merge window.

/jeff

