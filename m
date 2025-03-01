Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712FBC021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVo6nghuEpOQ+Nm0rERFSUfDDz0sz6FNiNMDN2cXVD8=; b=pII3Fv1UamPoCEQPN9rMHTRT7R
	Z/rLGjuhwuAWsSxaOtZkRKeTrrQfXPnS/UD4XnZv8ARMiLALZF3/67Bx34UNBSc3Z/IFtYNZPIZPN
	qzr2tP67ZrfYyhkaO2ejGkr3ySzs8rhL83Ry8vZsrP+4OIvc+0RGtpnvWpOzZfwQIM1sMnwz1KWuj
	BPt46aufvmRJuAtGOXmAw6e4SSQSrrVOJcduy0liZfOPgfLWG6uQsD6t26piqh+3+JGgO3/MfhR+1
	puFHV4i14V39vsrDDIcpdtHzemWRgS6AHRriHC7wWTASKwgusPtSkcwEW+/ZGPc4XQacgN2c6Wffe
	LkpjErYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toFDc-0000000DRLY-0wJD
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:16:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toFDa-0000000DRL1-1sMn
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:16:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5213KLOq007100
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVo6nghuEpOQ+Nm0rERFSUfDDz0sz6FNiNMDN2cXVD8=; b=LATHb1FjVZyZe4L/
	2eDmAuMKC80sld1J1fB8VfdLm3z2sqxr2JksDoOFzbq8u1wtYHdhKv0L3UpDJoc8
	Ernp4pV2sNuCmafxmvjil1bYSQbHGhDmjxEDMBuK6DT4OEoxcxtLPi2nQ770P7sb
	k0K5Uosl01vNat84WZimzvveDqL95WzD5d0qxLbs6/szEjTU8nDNxdIcO81H9q57
	/+vmO/pqTtJbaB8QktIi4Fd286ApvBUgBMZB9miVNZ1EYuDAKegq/9j2+5n0NXP1
	M02KVhbvZjbSww50XYkW8DeVpLKLdE5ZM+tsZk+mWBOiQ5bQH1kKfoJqHL9/g4CN
	Tg/kKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t88r5rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:16:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2feb019b13aso7389589a91.3
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740806212; x=1741411012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVo6nghuEpOQ+Nm0rERFSUfDDz0sz6FNiNMDN2cXVD8=;
        b=dotBN7GApnw9cju+rvMROqKdkE6kvqI9Ss88SkTjA4egeMTd0KdFq4/1teLfT58rlA
         UyPpjXTya1FUNrrpsx/RCWCNsHsymzLcdxnFhySyl+UP1mfI2e2veIa66PCWYLz0Frxj
         Qheu7Sh9WjVNFJzewrDLHnX7SSuDDbqy62o4qQWgywxhMZ+lCJWu1l43IesUamrP2xtH
         NSX5VU2gLqjqVxtmerTb8gXOg5V0VcpB0+twd5OFvpffw6+16zga+TICyYLsJKYM81LA
         FgRpsMNcWWV4W5L0vRAClPBbiQtrmzPO8R8SExFNkOkmCjfIK2a2nE6ECNEtA1yecbmZ
         /Khg==
X-Forwarded-Encrypted: i=1; AJvYcCXdKQfdwZQXachvrAugvYhd9mChvq62azm9HxZ/PZVTn7QF32GS7ePG4XRnkPC7Pk3wQ4Cf5EQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtRk0bgtdG9SUdmu7gN8rbzUXwpi2zn4+2mUzXVYny3RSzrkeS
	/Y/LMQ7yGWIEpambdEsfFEJGpzfDl37b+vLvusOSXid246LtHPTLSJ98G0wCeHKNytppAVFy3xu
	s5+q3qtEXPcQXU6meVNW7rt74ahX+OUTOcAK3W1dKGmTnVaCFWZ9rHqvKiKpz
X-Gm-Gg: ASbGncs/OQiJLLKr0tfi8//GhGc6qYla5XkQrl8usgJz/D5atqYz8auSiQa8AqaaYQK
	TVl/Et+T3vg3RZgen86V3qOlipviRgFstJmkmD7WK6zL3vdKWrJkSCRHAYO+0JwidyhVHPsauyo
	gQgHtzuBYPpXHWZqHtIl1u05xrORL33xu4U2Cit0VRGoVP2CsK3RwsZJ/Ktzebnay2vxTAeWyAn
	F0LZ7GPBXAUPklqnE4fRNc9agjFSvd1h2vFtjXEInfck02MYgD1zfr79tS1/XKMaxYubj2QIBGv
	oNdiKdSgkGHQdS9skvbBC6+g82D4/v7RO5d5Gn0Ps95DBKrO+hJ2yDHKGmqbrUQ=
X-Received: by 2002:a05:6a20:4307:b0:1ee:aa06:1a47 with SMTP id adf61e73a8af0-1f2f4c9c8c1mr9616177637.2.1740806212102;
        Fri, 28 Feb 2025 21:16:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqTLPw8t4o2yXeEVqe3vhe7yJW+wL8eFFyyJ0Nc6LXnxQe+y67eZQepiQeEEbsFn5E/Jfnfw==
X-Received: by 2002:a05:6a20:4307:b0:1ee:aa06:1a47 with SMTP id adf61e73a8af0-1f2f4c9c8c1mr9616156637.2.1740806211769;
        Fri, 28 Feb 2025 21:16:51 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec3e05sm4329848a12.49.2025.02.28.21.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:16:51 -0800 (PST)
Message-ID: <a7a838c9-2a97-dff8-3db0-940dab7e172a@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:46:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 10/13] wifi: ath12k: Register various userPD interrupts
 and save SMEM entries
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-11-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-11-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ly09f8wuYNya-Wt4sQxVoUWJG_6Cgirv
X-Proofpoint-GUID: Ly09f8wuYNya-Wt4sQxVoUWJG_6Cgirv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=815 mlxscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211654_608029_4258CFE0 
X-CRM114-Status: GOOD (  10.41  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> Q6 and ath12k driver communicates using SMEM and IRQs. Spawn interrupt
> is triggered once the userPD thread is spawned. Ready interrupts denotes
> userPD is completely powered up and ready. Stop-ack is to acknowledge
> the ath12k driver that userPD is stopped. Ath12k driver needs to set spawn
> bit in SMEM to instruct Q6 to spawn a userPD. Similarly stop bit is
> set when userPD needs to be stopped.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

