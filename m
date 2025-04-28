Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1815DC369DC
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INe4wjnjFUmwXhGN2W0SCm4GACVFxbQO0yQoVhezegY=; b=xp5rQzLyF+qrWuvsIR//7zosaF
	gK1pMhHdDV26+B9MHv9ocFujkFIX9q9aRkeHuilV3bN9HFOdv+wQOxeK+OEUx8YFGUaOcJSh9Rcy4
	YuJIL2kTMi28QEwbxkgWra+KOyeVTjEnA/hr/ZFtXzmWQJulOy3Dvf33FRBxecGj1NpjtK8YCj+fC
	CVZheoaLCUMRPYyHghWL0kVATihZgQ2jj2pWAIs+Vz+2NswqmtES0sjPCx0vXsYtwnjINLML1YBSZ
	81CjEKqM/aXr34eB6h3KyjHo32S45Zwkl+L9czYDB3qKG6BSdfSSOcWF0fpOdJb7p6sVgtvx+yygj
	jKzKUY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PKv-00000006ckn-3V62;
	Mon, 28 Apr 2025 14:19:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PKs-00000006ckL-3zmu
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 14:19:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9glvf028791
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 14:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INe4wjnjFUmwXhGN2W0SCm4GACVFxbQO0yQoVhezegY=; b=AEFGs9Se8ZCnADaI
	By5ZQFFXPoPfDM+v25wusbVVMHR8CnZRWq88xCYhwKDkJt6sCfKxsF7Ha+A2w1PY
	b7Mx/GvpaClLXqGo/1RIaMHVu8eb5qsRtqPuxKTJ1hC/gil2j4kXUGUwkeTY0Jfa
	owRa6gzzLvxTejuC7VkbMAcdh5InoeToJ3YrwIRL8pj3giXXMuLdvb/XEniYaUxd
	P9NE9GWzi+6Bde10HpQje73czAVxhLOYUK30uKMsjRbVip05Y4RWcZctJFt6bkKG
	RL5STephLIb254DDNvpL+peI8rczhCx31Sonjw4zNysp+pChCC/UWLGVU2OVDcVD
	x0RFVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jgnsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 14:19:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254bdd4982so71930155ad.1
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 07:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849992; x=1746454792;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INe4wjnjFUmwXhGN2W0SCm4GACVFxbQO0yQoVhezegY=;
        b=W3Y//1QDxld2Xd10CnBXhtEStOObzfGdu1vq6/EuNF48lzxp2u3ooeJSL2VYyrDPrM
         XwzmGDs5yLq6KvdYAloj9kd28vTG6RUgL8Gil/8xJaRsY80nVbUgR7WvZTUjkjaR02B2
         d2rIX+jNzqvPl6ZrYzDPrr1E4q3HrHkLiRB/ffKWVl9RRO6u0VypwdlXNRAQRdH6CyqX
         t4VzU4YyVVOow1ci2Goka9zZdZ6F+E6QzKBw68YtTEG4U8nsIKJJV3uhqQuMoGsuWrnA
         vlyY3UfUZMDtuaml78+WZGzjBgz8udVT63k0VE0B7x1E9kHoUOa2NXZ8KymLd+xBmpWw
         BDUA==
X-Gm-Message-State: AOJu0YzljlLFVNYtRe63Dn2/uv0MKiS2ku+kpaxQmb+Phbod7bFDNVP6
	gCvbATlFLhtE+G2E/8xLplNvzHXs81jTBPhFs+k/STufWLXf8ZPJjkyxgx8ugf/LWrx2Q2Ea4/B
	I5DZlxBP9Y9U0/qINoGwmP6DS8Z5hcqFAaqpwBsr1w9OAH8zRH1o6lrCSlhXF
X-Gm-Gg: ASbGncscW4BFt1tSd7aZL+XIQKrcM7aFPz83H5VlQcaXaQ5IXGRyu9wCKCG2Ej9lB6k
	WCISHw7SOWYPoleb3vIc56WkkOzxYKCPcB6MmCgKcXnw4ipkQi9V6st/bBcbRy87mSs+ycwiyeH
	eIgoj1KzOW6SWX5HvSw9rs8r9ZCvm1KK7Hr/ZdATndxJRlxt72Fiq3dlpw3Gjq/jeUbOCqnff0O
	5IwDdT28zYF+FMhdsV/qsunJJVK0KCG+/iFSBlcU/lQfgbD7eYaYYohW2OWuIWUVUyx6sz2GtqB
	8YSt6qDRufhjf5WXdKknEd1ucZDAdgi//8hPo9IOMhTgE1h4bpyKymbfzToOGboqlzo=
X-Received: by 2002:a17:903:1744:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-22dbf633583mr158873775ad.50.1745849992057;
        Mon, 28 Apr 2025 07:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtDIrbh0jxESGTPVjOYceg0jr+nzwxXsD7pVRBZpm4gj1i/GS5ULqzx7IwNLa0zI5iGno4Zg==
X-Received: by 2002:a17:903:1744:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-22dbf633583mr158873435ad.50.1745849991686;
        Mon, 28 Apr 2025 07:19:51 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d77e66sm83373235ad.20.2025.04.28.07.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:19:51 -0700 (PDT)
Message-ID: <ed88961a-4060-4a64-9d1c-2d08bc4dd165@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 07:19:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: MLO not working in main/main-pending for NCM865 /
 WCM7850 in station mode
To: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
Cc: ath12k@lists.infradead.org
References: <231C035E-18AD-4ABD-91A5-841253644C2B@gmail.com>
 <7001407B-8507-4CD8-B96A-328927D6E286@gmail.com>
 <FBF5892D-0A0A-4AF9-9D53-B3C76673D797@gmail.com>
 <a5bceb0d-bc44-4bf8-b08f-b56b637b28d6@oss.qualcomm.com>
 <D1F01BA0-8B75-4B62-A060-D43C666820F2@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D1F01BA0-8B75-4B62-A060-D43C666820F2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDExNiBTYWx0ZWRfX7HS/fsTVyx5l S4l5aND4KpLd/rehvLJUVPzl0zf+NidYaLsr3/ZvOZSi6mbEgqr1k54VMmxIaac3FjH13zdXJKo fT702Vxo2FCmOr+hGon6Oms5t/XQNvltcsluiMIixcHjFGElTUA08Z04Sh43PaA4bfuDZc+kxL7
 sk4fRwMmg0/hvFU1NhCV78oR66tuPExFhDOJqLdfPsot/d1ApgJolRDswUoA/bkx4BDluU1dcg/ XhOZHFG1WEa74Ddl5UEEx/kA1+04ke//F5Qy9cSczjvmS8t5G/4q0cPyuNNMYkup3d8xegaoPhD EHHW0Ov+u7Ot/dg/rl7/UF0aBjHOyZ7aasin1Da8OaT/o5TEQRrVeutPh9gFZyPdeoJuqVEJ1XE
 61m0+odV4G/aVSDJJZePWSEdtuu7XmoDYvYF6FtIWpPLxEKINSxoPMWOROG/huiywrK1hJvo
X-Proofpoint-GUID: Svg5ucZcCD6XvBL4AAy0xISJUvZjd2_s
X-Proofpoint-ORIG-GUID: Svg5ucZcCD6XvBL4AAy0xISJUvZjd2_s
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680f8e89 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=xSBUBWweaWCPaFR8eU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_071955_013248_DE14B222 
X-CRM114-Status: GOOD (  11.85  )
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

On 4/25/2025 4:52 AM, Benjamin Eggerstedt wrote:
>> On 24. Apr 2025, at 16:28, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>>
>> On 4/22/2025 10:35 PM, Benjamin Eggerstedt wrote:
>>> Hi,
>>>
>>> I compiled main-pending from here https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=main-pending after "Merge branch 'pending' into main-pending ath-pending-202504182357 master-pending main-pending” by Jeff Johnson. I tried “main” the day before, but saw that a couple of additional fixes went in and redid the previously and unfortunately still unsuccessful test
>>
>> Response from the development team is that the current public firmware is not
>> MLO capable. An updated firmware will be pushed soon.
>>
>> /jeff
> 
> Hi Jeff,
> 
> I appreciate the feedback, thank you. I’m happy to compile, test & report back once such firmware becomes available.
> Feel free to give me a nudge here.

New WCN7850 firmware is now available in linux-firmware
https://msgid.link/CA+5PVA71-_a9nG-vULohgzbSfyFyWOB9RE1x4D4vdUbw4HAegg@mail.gmail.com

WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

