Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E78C7115B
	for <ath12k@archiver.kernel.org>; Wed, 18 Jun 2025 03:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH/xLON/sF+RHyfqsMlGQqmogH2BUwLihx6/jpfEEdY=; b=GTDapJy6obsa42j2UgVfe2UV+U
	vcTSM46y4+RkeIlFqgDDPhlFrJvwGMkeqi0teHNrvYvmLHwINA7B8DoBO/APL8YRy11uYZT+M3fla
	W1EJXuvgcy6H4ytSzgL2hY80KOneQWV4LKYCVE5iItDyb+0JAPfefhP+yd2telBusvGjp7YMIX1JO
	syB8wlZ19SmqzjTBaJ63rPfEyZAjjuW5kaXjl9EKhJz92uVhDkRcACq29DHunZcu/sMt3WxjizXsg
	WjSE8H0Qd24hTrJaxWuS4AK0IUlxKO1mS/XWsLlawC0QEBNY3a8KV289FxlDTxU142cRVV67WIckq
	tJhowVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjc5-00000008v07-44eU;
	Wed, 18 Jun 2025 03:37:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjc3-00000008uzk-1Mls
	for ath12k@lists.infradead.org;
	Wed, 18 Jun 2025 03:37:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I18MMD014509
	for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 03:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SH/xLON/sF+RHyfqsMlGQqmogH2BUwLihx6/jpfEEdY=; b=m3n/VMBXVRWxuGy7
	mhHsI7Fi2d+DBJ/mfJ4tTRmJiUKnWdOMNhOAbH0z1wNL9EelBF1klDWZJr+cNx+I
	nb5oSuMTOZ3lv2U7xVCHjrDjAxI7asDJwbHzBGqwZY3wfyDlUH17eXUZBZCem7vT
	PUEMWojZRIfQzctIxMMPWfZvy4e/94fHc0R2YEpgyBhUfGQ+Omm1mZ9QranM58Np
	Tky4IILNfsrbfa53ZLKb8HUfdTn7/rms4O1wbHvGAA8KbpJVCGGfE6yPNBNf8bbi
	IVAH7kNjVQ9jHd43Q8ZmMONaKNvlanEmeCVv7dEDEyPmMWYTMf5auniO/9iVQVlj
	DNL+pg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7ag2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 03:37:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234b133b428so48029385ad.3
        for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 20:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750217840; x=1750822640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SH/xLON/sF+RHyfqsMlGQqmogH2BUwLihx6/jpfEEdY=;
        b=Mx6N+ZKJZGQSWKJw2AP2+k7JAMyx3JpL/5h0c1UI+sjUbz+EsZSgXkBiaBc7qdQZIB
         SUWAIxE5fXGM+nZX1Zwf4xYwRfOP1XCVhjrlZXR73d9x9sA9sI/jnTUQU2lSudkKVCkr
         q9BofiO6Rb4cC9ymlIMbM2IPw0+Rq2h4h/Y4hyTEgwIA1m3i2ZbDUAsRtD3e1hV9Y3nC
         M9a97GBW/ebvy8QzKBQKoCG0+EDo1tN6gp9AnH+leVnuZec7Es9wrNfPfNRf+T6ds81v
         GbqTHTsWcOpQpRI4ZHSExJM7+cTIv0tunsYqNLsUxqXhlEslwGPfP2nFt12ZvoU+IWcg
         pfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqp/8HNwLRjqLkjhxUwzrJNmDuSTi7LLfEcIM+LHUtaFP+RjH3rg5DdLJG6ncgMYMvwUPXU5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYncyIRZTDCJtEVdx9xC4oAn6ErgT6b/jG096QkdyZmzc1S9uq
	yfU/B7Cb6LUNiyQ3ELvUoIcx2WZsqe4SdqqHwAKIfG//Bj3IcZ7W/MQCHk+Q3bjfRxAxlqmQ92H
	N0x7+JGTGZn26OROYhw3Vev4u0ZJZ83TuEMO1rqIQ+aPZwSEBd/Do4hCN++t3rDco
X-Gm-Gg: ASbGncvxXYE6NdQ5SN5uyZnZq0C4CFdTI0MUiSP3N5r8qIkp+GpWsTt2M495A6uXqrQ
	8Opq56tO25KYg8FUnXjRdkcY30C+ZH3bFlfNHW4IpXwURLMQoXIky58lrqramgxR6wuuGUnMcag
	R1GuwBd6atsWzTepTOVs6fGjEyofZL0Px1jLH8gSowC9mt6XESHgld5WjP1ZAWCSh2JRRKrO31V
	2zjVkFwHIU1mgnBiQeXDWzpE9LE0TCU9nkNqo69DZWoiI+78XePTLLwI6fBXTBUo6BBqk5+G/iz
	LpvBUNFfaoy43SboBl8sHNB1xDa+YQrQ63p6DVFALFQLfjLiZEmlg+f/gWniCA==
X-Received: by 2002:a17:902:f710:b0:235:f45f:ed53 with SMTP id d9443c01a7336-2366b12fdf7mr243385485ad.33.1750217840208;
        Tue, 17 Jun 2025 20:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHak5M7iv074ewtls6BEJbLqeOl4DjT65kZ9T6yLL/AQRZ+K29GlOkPYFVEimnTq9V8mvUYCg==
X-Received: by 2002:a17:902:f710:b0:235:f45f:ed53 with SMTP id d9443c01a7336-2366b12fdf7mr243385115ad.33.1750217839747;
        Tue, 17 Jun 2025 20:37:19 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decb846sm88993475ad.227.2025.06.17.20.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 20:37:19 -0700 (PDT)
Message-ID: <00b8335c-4692-4d8b-89df-4196e11ddaee@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 09:07:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: update channel list in worker when
 wait flag is set
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250605082528.701-1-kang.yang@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250605082528.701-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyOCBTYWx0ZWRfX26FCiKRwIk+n
 HIhknp7itjxx1NHGmxbniyK9FniE42IgOsmFwvxfieUpEI76C4GQGxaen5+MtVLgmE7L/RHzcB8
 vHPIQs0a7LlLxYimDjfQ8AtQtUXYrngUX9nkADgPQo6OYUtvLqvv9T0va/qqsZ/1t5H71pWiPFd
 f52pVQL8KrjVDnLgsYsIJPL8RMRzhKEXMz/sj+cPbiZEj3cW1L7Pa8zQaQLzBPrwKrZvq08Mmx8
 7Bpg4S5IwoT4UvCx6/o8aT1AgmKL+mLXWvBY2ORx+ytc7ALEDzVInM+ebsuFYhu2jzeh15n6oem
 O9yba8DeZHtU60J4OkvvOB8PWwdQJDODApE4l6FAhIO9JCOKDNek8onVmxYjxDjT4GnxENUwWzE
 NYGgl1KzFad0j6WtrDvBEZcnvi9LktsZJy4DKV3euml6w46MGv91TqPnSBmZVegbxbB1heEM
X-Proofpoint-GUID: NF1oDffEDnHXLXwAomde8SV_QgqhykkU
X-Proofpoint-ORIG-GUID: NF1oDffEDnHXLXwAomde8SV_QgqhykkU
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68523471 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6o_ezUq-1U3ah4PhcdwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_203723_495539_89847681 
X-CRM114-Status: GOOD (  11.57  )
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

On 6/5/2025 1:55 PM, Kang Yang wrote:
> With previous patch [1], ath12k_reg_update_chan_list() will be called
> during reg_process_self_managed_hint().
> 
> reg_process_self_managed_hint() will hold rtnl_lock all the time.
> But ath12k_reg_update_chan_list() may increase the occupation time of
> rtnl_lock, because when wait flag is set, wait_for_completion_timeout()
> will be called during 11d/hw scan.
> 
> Should minimize the occupation time of rtnl_lock as much as possible
> to avoid interfering with rest of the system. So move the update channel
> list operation to a new worker, so that wait_for_completion_timeout()
> won't be called with the rtnl_lock held.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: f335295aa29c ("wifi: ath12k: avoid deadlock during regulatory update in ath12k_regd_update()") #[1]
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

