Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842C8C98311
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EipT5pYVDVhEVttGRYx0g0vRneeQ4JYuUYGj5ngSQD4=; b=I2Jy/qNmqw1Wk/B3zuIRqUEGdi
	Nr90zgGarZZTariW73AM2C3Tm28IHaoeUjT6NOZrTue40sucZkjivishzizyHMzI5r9VBpzsv/VRz
	PuLdOPI79Dzu+Ie1eK6bQwBh+0hX/pZoyUxLHvhSPqDY06ekiQVvDBFpZAEjjiovat6gRKNBVMHf8
	/eIM9sr+YNBBfn+l+kuenrKepg0gWknlWsvMKHlYf6/zSbSCOKt1tnE/S+zViKPULu+eJSlYDOpQa
	8GOAb7i8FTHBKkfc4G88/XzIladynaFhl0QqNnshvDmYzPBDgdRBrtzbvGyNr+EsBvjPHa7GSmQYD
	K3KRyCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g1E-0000000AcaH-0MWZ;
	Thu, 24 Sep 2026 09:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g1B-0000000AcZv-4BYp
	for ath12k@bombadil.infradead.org;
	Thu, 24 Sep 2026 09:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EipT5pYVDVhEVttGRYx0g0vRneeQ4JYuUYGj5ngSQD4=; b=rBbrIJ2gmAQ8vc5q2VPwe1MZeY
	5YvXx2HlURAy+Xmxn8z5nW3w6Nxpl8wRx5Z0+01ooIPc6G2H9JeIVI3pOHEqPysvD8pJjX3k5hjj+
	W9j35RSeddvmmy4TL37gV+a+JFIKDxXCXShywNnNgtoKhKkensmkSh1UUYUGTVo/Oum5S0+9V7+Ds
	AjXcQfeYpXU5LSDpWLkpLEDMCk8LozIu8T6/SL/Kd42vF6zv0A8tToMF+VskadZmP1QjvrmUXOpq+
	jxjUilR1EQfcRhOchtklADI5lCKNz6s8LFiC3mVwVzcQ/0SbwALgKEO1F8B0tSJbTYGS6FaYDqGSn
	dyh/y9rg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9g18-0000000FnlH-3ilh
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 09:45:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q66G2238067
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 09:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EipT5pYVDVhEVttGRYx0g0vRneeQ4JYuUYGj5ngSQD4=; b=H1HapTO68ShtonSW
	G5Wwwqy2WvcWyEZCkYyX0wIncTc/uyybk/SbEic0cQBcy10oStnSKQ0I7IZ4PlVp
	vWV5hG8mgga+mYkGwygwFyDxyVrrQ5NALy9vbzXWt9jzI6rHR1TobNV+t90EmKV2
	wWCWqZUzDZmR9dgsniT1XJHWEy3kmMgBrQuGSH3ZkH0W9yFBqoH7PD9iJMu9UulB
	bQZaYZkIDlNsk4oB0oXHeYoT7w7UTTBRQ257IZtjHNvKU7vTmCrWfUZ4lrBxU2iS
	drhSPKJPLjBZE/Qg3kBtXCwO2fViYRih3rFh1sJwMUNqBFHhD1zA+ECzw4P3bnlx
	EXa74w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbmc8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 09:45:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so2031075eec.1
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243121; x=1790847921; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EipT5pYVDVhEVttGRYx0g0vRneeQ4JYuUYGj5ngSQD4=;
        b=OsVTZc+GkVMswzocNczBU63Lro9cs0gv5iXHkvwpgkr0eTWIM2trz/qE6sTOUHu0Rv
         b7Knj15h/usjQk4qG7TBwp2iY4McQWT3kO3hye4OnKfDg91fef8LpbHOiXZJRVFzx+yQ
         BaUU/jxRAEgIepf8SSN1kfx5ZjHEsiFsZuaoCAM2yJp/19pz27cvfExTfldqvdCK3CpF
         dXijNxdUMPYTQa1u55xuNcW2xyCmQdWOzIo/oINMdm1OT7ukN1R0NibvU0NG1svPDRFP
         q8M8sEAUCnHIIdvR7enhJf9hD0QWM7fMy8c6danjDggJPHfkn9KRSrOyxOvNJnpkfW7J
         rCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243121; x=1790847921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EipT5pYVDVhEVttGRYx0g0vRneeQ4JYuUYGj5ngSQD4=;
        b=pHtef3OQB3pUQt5a+J1bcGdw2m+9nZ+9tc1QuZ3irpbTpFQTp2Kasr5F1Lruwxb0FS
         rL1Y7SYz5xOexEFQSFpTrnZPx1QfN3R7ncY4H7E6/LNzFqxar1NL10AwlQIeCJt2Bqa2
         v2zzJENeoKijwNAAR5eeCPs1rtP8cqFKC8vGgMD1rtn/1jfkdHmwNOLXPPZrprLXBnV4
         EyvvTWd/AEfWzBnBppzQipx1bP9PLJkzX3m72Y3jTCOUJNPOcXgkZoW4zGrDQr0a41XA
         0yEsc9+uubNli3v4I7vHXxpGmlVsPtIh3DXtT3Wld5fsUBs5ckiXNaqa0EvZvI/ME1LF
         IGJg==
X-Forwarded-Encrypted: i=1; AKwUvBw3zjqvxJYql9aix7RyLgrT7DIPApSKfggoJk0llStrTtwI7PVTvNIKYhtUB7gcE1sjB/5fiuY=@lists.infradead.org
X-Gm-Message-State: AFuF++l7Y83oJsG/8wRFsrpFbCgt6r8iC5gVkVZSwESB45HcGxccIHQm
	MpWKM0Js1izysx8exdGFziUwU1oa69qfkGoC2tzwP5GmS5nrfavw0JU9vzD7GXxKu6zzpxoyqY9
	0Db+RQXOcsAvgUu+sOY6t2ngnLF9FCWniwHgmL6sJVKl2rPWjP8KNA+czKTwsBgp8
X-Gm-Gg: AYBFou35wqTspw5zROVru0wn0ycmjBoenlbETAr8oYFwEc2ZzPoxmKOQrU/0z1/6Mo2
	IPQT9hDGEzacsMT0hI414tRJ8XAG/ZLaNQDoxvVh9Qt3DdLItEqyuDP/+F3895NBmnbDj+KFaxV
	Js3rj9uaLD2PhqP96LvEKsG/VTz0MBe2iP7G+x9j+wrqBz0goCcyePr2GSopiJDhXK8MDbf2n4N
	7+qz4lbELxWAgHP53kYdKbjgehwE/rizhJuq/oqX4GqgQAl+sGXa6tSmNhdhIbJ9tCA4VxHsWLk
	LmINUH/ql6q+bkyBIztz9KHCq89Aw4lox/E8Apj3FXm9aW20DOYpPtAS3lMgEC4f8bJs1fBEmL9
	2FIqTxdkqmY8XAPKin0KjqipoDbeo
X-Received: by 2002:a05:7023:88b:b0:144:c11c:370f with SMTP id a92af1059eb24-1450402ce4cmr1656018c88.30.1790243120888;
        Thu, 24 Sep 2026 02:45:20 -0700 (PDT)
X-Received: by 2002:a05:7023:88b:b0:144:c11c:370f with SMTP id a92af1059eb24-1450402ce4cmr1655993c88.30.1790243120335;
        Thu, 24 Sep 2026 02:45:20 -0700 (PDT)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f982089fsm12439685c88.5.2026.09.24.02.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:45:19 -0700 (PDT)
Message-ID: <5e7ca8e6-bcb3-4fcc-b4b6-1f7bf2a69411@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:15:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
 <8340ba71-cc37-4dbe-a82a-b88d27c0703c@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <8340ba71-cc37-4dbe-a82a-b88d27c0703c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX2c0OHfhpM0vm
 QL4svHJ6grtoD0m4f5MfGGcBxZOoWbEL6yC6S7ayH2D3VeC1YXtHciQ5xEu2RtRwCfTXhkJhFHW
 sZe8ELTwD81Q6J1V/rSLqwHmS2/rpDA=
X-Proofpoint-GUID: B6amd-t_PK6QlMClNYF2uGksVYJ3fy9i
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4f132 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=z2ZSEd9kmZY8weE0PYEA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX5go0U6XUZx/i
 MTTwXJ7UjYeP2W2P2hZBxC4uLZowr52zFf3y+KR0CM7igGq/RSLIofn0tmqXxHcpIiUa1DdGojU
 l1pPzp//34l+ja1Z3jpIcPCBdMJahFuuigHcR3D6BA0y4iFIAkUvdSQMDjxxNgDmoOVEcrmtNCb
 Qp1PVYv19kG2146UB43Uug+NjIvSv/Iw3etJaB+vOhYzwFPkEGirr1JOhPhWq3+Ytk/3BIZd2f3
 p6XFveM7ZAtTdt7fo6TysWspIB7FgIi1ohlDCZkYd4bEP8p37AB7Of5t5dvUMR3fLW5+alqXbcq
 3CTGLUE/7xoq/MQyQQfEzTAPpa0LEZ8pB07j0NY4+ZRowINeEqFmkH3pnAHRD110SOaBbVDKxvl
 9usnU0CguA0MlDJ1O1wUFEo3zHpd33h0qtWyMOeVo5tqzXnaQ5C00+nyxJfOnVlULpASAES8lsS
 XkdPUChfWPE7p3PUDDg==
X-Proofpoint-ORIG-GUID: B6amd-t_PK6QlMClNYF2uGksVYJ3fy9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104527_366135_F66D764A 
X-CRM114-Status: GOOD (  16.13  )
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



On 9/24/2026 2:15 AM, Jeff Johnson wrote:
> On 9/1/2026 1:56 AM, Aishwarya R wrote:
>> ath12k_dp_link_peer currently carries state that is not inherently
>> link-specific. Both the station pointer and authorization state are
>> shared across the links belonging to the same logical peer or station,
>> yet are stored separately in each link peer.
>>
>> This series moves ownership of these fields to structures matching their
>> actual scope:
>>
>>    * Store the station pointer only in ath12k_dp_peer.
>>    * Store authorization state only in ath12k_sta.
>>
>> Doing so eliminates duplicated state, reduces bookkeeping required when
>> the state changes, and makes the ownership model clearer.
>>
>> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
>> updates users to retrieve it through ath12k_dp_peer.
>>
>> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
>> updates authorization handling accordingly.
>>
>> Aishwarya R (2):
>>    wifi: ath12k: store station pointer only in dp_peer
>>    wifi: ath12k: move is_authorized flag to ath12k_sta
>>
>>   drivers/net/wireless/ath/ath12k/core.h        |  2 +
>>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
>>   drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
>>   drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
>>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
>>   drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
>>   drivers/net/wireless/ath/ath12k/peer.c        |  2 -
>>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
>>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
>>   drivers/net/wireless/ath/ath12k/wmi.c         |  2 +-
>>   10 files changed, 36 insertions(+), 84 deletions(-)
>>
>> base-commit: e07447e654476262558bee570f4cf456e2b32565
> 
> This series no longer applies, can you please rebase?
> If the conflict resolution is trivial make sure to carry forward the
> Reviewed-by tags.
> 
> Applying: wifi: ath12k: store station pointer only in dp_peer
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/dp_rx.c
> M       drivers/net/wireless/ath/ath12k/mac.c
> M       drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> M       drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> M       drivers/net/wireless/ath/ath12k/wmi.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.c
> Auto-merging drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> Auto-merging drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> Auto-merging drivers/net/wireless/ath/ath12k/mac.c
> Auto-merging drivers/net/wireless/ath/ath12k/dp_rx.c
> Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.c'
> error: Failed to merge in the changes.
> Patch failed at 0001 wifi: ath12k: store station pointer only in dp_peer
> 
> 
> 

sure will rebase the changes and update v2


