Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB1AC982FE
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUvIhBuiOIGVTHL/fz03Bgye1wplgivSPR9c5jQFA/I=; b=Y1GebEIj3jQTfPS0Flz1NGLfkA
	rmqeNiE1YWpP1hKXnJr78iVnbjq17+d7Z6RfNLLKPTEzN8WkHBaZTKZrhcAavTa0mx1oZK2ZRsCXS
	QAKqua9jzRtAIcjYMog2WGr6fiJdj6XXXPFdcBx9RwFBfJHuIgJpVekq21cWTXIweWpwlis8mG7Sl
	iiPHWeuFmz/MTsBaSK65wwDWtwliETpcxYrANQd7RHFiV5dTk/P0vbWdO0y1N9mEm0UNjRO9FqsTT
	rlZCAS88/GU12WFiXFA0M616ejUPA8fU4fTzCSZ+585tBaT2T9jNzx02FOQ6Onr9JdTkMBHPLk3m/
	LXsabzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Aat-00000006lnS-0ipD;
	Wed, 23 Sep 2026 00:12:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Aao-00000006ln5-2mP2
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 00:12:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72Ri1153702
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 00:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vUvIhBuiOIGVTHL/fz03Bgye1wplgivSPR9c5jQFA/I=; b=RQEnC8/o0N3oiz1O
	CPC1WMuJDHvvaxHEjdHgjgEkgk5D3mbAeDL8itJww+z88fAhD3CXskDjQ8ijnOXK
	IzTqTbBAkA2chC//xTZHZQtl+/xL40mSc4Cm+4HnriLlwW2RTT7iB+Jj5lAX6RCO
	iQb+UjSLNgUv3U5JDNcFuRUdCPvB2Lvn8khR8Cbzpgd+4uNnzmuiIFOSV/irQ3u4
	La1zwz6vvS0YuUPt8EwqRSJIApKOAX89SVbK1xKYkYhmzIqq2Ad2TF007sVxnOI2
	cV2S3aRp/yiRRjCirIrHss0PsBYMU8oq3osvMgppEw+KgY8TDANfQkUBL06Z3tFH
	uI0e/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7j7an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 00:12:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-333543ac378so377938eec.1
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 17:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790122324; x=1790727124; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUvIhBuiOIGVTHL/fz03Bgye1wplgivSPR9c5jQFA/I=;
        b=ZLdcYpMD3DfmX+l+VzZOZ6AsGmMKuHCzl+JdLUPN3BTZa5VLM12YKbb9VbfE8NylFg
         FEqfUczFBeg1S/r23UqRK530H6iFkawuBsFO1aFgkoYDPCh12FkOqHwePb/H4/yDWNX3
         LmiboDZaZRABNK7aCl61vY1hDq3fp7e0JF///ZLIKzEx2799O92gKNcAXD+g5nMWIf9Y
         6kELKZgCquDF3ERxC2jEqGLPbz2luaqjbtXIGHwdwlIt4M+mcxYmI5EuNIokZnYMRDSi
         d0ff0mJEeHkROtE50nxO2DSulc2QyFXKdccR2tU5/a/1xxDRQkFk2tlnR3tE8pCnADiC
         zbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122324; x=1790727124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUvIhBuiOIGVTHL/fz03Bgye1wplgivSPR9c5jQFA/I=;
        b=FlJfpee0urxmpyg16CKYaHIq0jZZIjKREPgN3KtqXvSZVnVClU1lUxT/5QyPpTFuO8
         c/V1vU6EGn2lrLeRFW04O5Qv0A/l9DOnZ5yGjet/kKdcTW2TGw2hPyEeUTBGOimHpU6k
         lMmrgu8Y49XPgE/E3Ce0H+bpeMNzbAzJWl5q1nMuUL8uVMN4UilkgaCawLpvfjD21Pu3
         Tu4tvfl6U8lezfghLL0e54nJQWJj9WjAj3ua4/trEJAxnCivQ0OYVNgRjJBLQO5pcSUT
         cxirtuLar6+mD7hp1uwPL48rYsHkNJRIfEapeXGJYTWDfzeHN0cKx93sWLQ8wAnEYg9M
         bTig==
X-Forwarded-Encrypted: i=1; AKwUvByWHa4E67PBqxFYldwBeRVptO5vHBYqGlI7kiNFpMNQ4POPizEDIy6UPbbTeUJLFaS+1MhGXsc=@lists.infradead.org
X-Gm-Message-State: AFuF++lsnQmbnSIVUMlDGb03HB/9A0WWUYLLzMEj1vIrDQOdD/kEXxJP
	4fjANU2nAZDRXhVBr+8CkJXMURitvGeZWUVPeZlgtZ+jxcbZgNulQuuJihSHHhJ31AuanOItJyc
	ln+0XYsc+yjYglezo7CHh7FUOeEYpED3uhXhpAQJunqR+QdHoIglZ60d+5RvVIV7CKNlRPBAW
X-Gm-Gg: AYBFou3mfADpGRqXmGi3on7rqYUyGqX2f3wrrpT4Jtt9RPa4Nh6raw74n1HiPMCm+rb
	YFEChnGdXkQheK+w+cs7j5f9boMRk6WTqw93270Q02y9P61ryiguWZIYJqqLW3SL4u5XuQk8Y9Y
	GMW3XNllWCluJVgzbSDsP6Wcmh7Yj1Q0rGqOKUDsSYiJO9yskNG59iaCaTkLS2+2yttkZi/ptD2
	WI5IFVBZynPVKBC3ayYVymUGirUWGBWXgVtfWeS+LyQNroiRQ54nMayT2SqgR03zH7th6YLKNpq
	LLx81c62k4bv8GoJq3OMs1/1+IIhvB+1Rk+UDqbbQQjGvZCwaIPx4krL/4uuL0VBZMdfZwrRqay
	vrX4XFIbstuIpvEMwX/Mx+mbi8qxj7K3uCi2Q0J4duFD1PHufPXkNfNypAw==
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr791804eec.39.1790122323704;
        Tue, 22 Sep 2026 17:12:03 -0700 (PDT)
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr791766eec.39.1790122322914;
        Tue, 22 Sep 2026 17:12:02 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm1544345eec.25.2026.09.22.17.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 17:12:02 -0700 (PDT)
Message-ID: <435e3012-9b6e-4327-97cc-f65ed1e0e5c0@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:12:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 4/8] wifi: ath12k: add device DP stats reset
 support via debugfs
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
 <20260819053247.1420393-5-pardeep.kaur@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260819053247.1420393-5-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfXwTn6k1fwNBhT
 3GWfsqGC90HCYkiqpn7Ed/ULhTPxmbzGC0qqSSl4H7c9HwvuqOW03q6TQeU8SH+txiig2hVqpQS
 7PwTTZ42M6dGz2/I5kKtzLNjGd3cCFA=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab31955 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=53jHxVQQaW14DdMQJ6sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: DkxnB1SVX-67na9DnBShojJ-q7r_o4Zj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfXxralt76DrAr9
 3jDVb0ua/HNmsn3V+lwKsMhfSOVNb70trR2p2vt+SV9dBC9pmvCsB7sRExpXup0HHjrr/CKoMs4
 76l77wG5iawexejp/rF6UTGave4YkYzrvRTYBSckpN+wMUsHU3RLxMp1gd1Mn508RnY9/6nM4tg
 dJiBuGDLDkkQgetWRzGBLNJcLR+7SfyvfHbA5p+DL3gQ7ZOfq9X5GXDH5LB/WLSur7koE9/62UM
 4oHfLnxT5QRB6I+nckMjLnRHDLYSmyt2Kya+khuKveNh7+ceh1eI+PDNpglTFWqlCH/4UFghRnS
 qwfXtWUUdPuSyA3qVHMDhU6hGjFHXxxpuCVd/5TpJ6V6qvXATvqGKiHr83VyHp0HnTtqv+zloJF
 H+v4bCvQZMt/YiichFloIdU9WsY5Ff481uF/fyBjQEagq43kRcxY+kEdMvmDA6O3hQvEIlu/5dr
 oEHZyiZNxA9IN/0t/5g==
X-Proofpoint-GUID: DkxnB1SVX-67na9DnBShojJ-q7r_o4Zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_171210_946797_E361E9C2 
X-CRM114-Status: GOOD (  14.53  )
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

On 8/18/2026 10:32 PM, Pardeep Kaur wrote:
> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> 
> There is no way to reset device DP stats counters without reloading
> the driver, making it difficult to isolate issues to a specific time
> window during debugging.
> 
> Add a write handler to the device_dp_stats debugfs file so that
> writing 'reset' clears all device DP stats counters. Change the file
> mode from 0400 to 0600 to allow write access. Use
> simple_write_to_buffer() to correctly handle partial writes and
> non-zero ppos, consistent with ath12k_write_simulate_fw_crash() in

in what? the last sentence seems to be truncated. Or perhaps just s/ in$/./?
if there are no other comments in the thread there is no need to repost just
for this. Instead just let me know what text you really want here.
> 
> No lock is taken around the memset since the counters are updated
> locklessly in the datapath; taking dp_lock would be misleading as it
> does not protect device_stats updates.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

