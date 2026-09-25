Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4916AC9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=; b=pP+0KZofrJhLmdIrMQH8faSeSn
	B77bp9ZjQxYqV0KaThB5vsvkqiJH+kgevu8JeUlpKtctY6QXnIBpGq2wTGGwRcn8qMDUkgQ1A58KP
	JcB9ZC9ipAlTwKl9hyDCKRVuxvvrDFNE+Wn0jIw7mHP6SWbyxNIZbq9RiaHOhc/eGeau50Wl/l06N
	Z/TgJEPbH2yDdOqWjtbcwhOtZUs9L5rbIWRXdoVHObMIKHWA6YV43A+vuliXgavkcIpzvCNhRvkh3
	9cBJcEunqE4SjGxgUzj+ebHwTefyRJ8Lak2YtKCVfR36xABlmblzAu9KNBseGJCEP1jAd8+bkKwdU
	5H1p6k1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pP-0000000DmjG-4A5U;
	Fri, 25 Sep 2026 15:27:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pN-0000000Dmhv-49bN
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=; b=n/C7B2v30CQhLtLhNPDHvOytRm
	QqhF/TtMXHIoL8mjWVlBQx9qvpyOQWBf+MEGNIGTG/fjMJw0aPoaio15gQFfQDBSC8hQbEDAuofyG
	Ytl3OLtlZ62rWAVi3PSyrsO2RlCCx/JPuOd78+c+xzFf9hQfCNBbIq2qzcEaguv2xbpLSs1bCk/Sp
	IxorQNo1idL3QbiwpNVOqTR6L8iu9v2tu8koW0qaPQ/Jp3ruD3xmstjtJa7pZGa+jJbkphAdx+eQP
	ZKAi4VVfYqy8w1MCiD+DHcwx66ln/QuNokLso46AbGzN2ozsChpOCCi+U1FzllhNdBN+yLQTHgwTK
	b8SkgT6g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7pL-0000000H3kK-0Qbc
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:27:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4B2h609087
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=; b=kH4u9bZYdwxLpfZj
	QiaChiBaM8GhMYpYgLeZ9M/J0R+Naqwh3sCeEqBW4n+DsTEnboRWpdEL4Z6MbrF0
	hyDArFR6mgg6dbJ8N6toZvvWfcdfiTjm083PRdI5gumqBc86PLJ6j3MSS79T4BKx
	/T+UZSJSsNM6+G7poW6+9ncu1esUVlwaxl2+edB/uhyFzeTgkjTy3HzTN4C4ts1u
	5QdJtfuvCmro1M8grIAp8CG0O91Qky73mSdjuyKiUdLISO2Oe81xRzNeIu8OYZuW
	MhzQ/2LWhP1lYX2f3PiQvmBEhEzwrbnOxuQTKxdKKzf/dgTiZLZqE5ihPF9OsiBi
	KpqkLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns2ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:27:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2083585a91.1
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350024; x=1790954824; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=;
        b=h2tLBbsyF/5j9DeQI9io7SjgkJoZOrmvlDnTThxxhYjZcZPA6/bV0DIM0nu7nCZ+t0
         YEWUax7M1twlO5O1v3tQO0K8kF6G8ZNjZtX/8TYcWLAJtZd0T9Moj/S0Poy11u6cCFtN
         YOBWG5yYkrz4asor4CbmxjMlHZBc/Fa9iveuf/S2XVHqoLlE+OMkOodVNc+NZKPjAO09
         4KKbnpr7w1QfbZWt6ewcLksyYxse07Jiej7XVTd6qWrWMFAY/OAGJi0GecZKh/2DSRdu
         0xlOe503C3BIKUYYVZwoMdK6u4HiPOwkl9W3LXi8Oey6D4vd8iaNs2mvuRVsyFjMwV2/
         2O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350024; x=1790954824;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=;
        b=O2NEjUS9yPAWuu4CAhwO0WlV3glfY6KdmwY3VeQI37JBibON54JA1gFBNNPdTI294d
         PreP3Z652rzv2+0jN+dvA5be0HzDicLK1ex6kMLF8DR9xAmACxCT/rxyy+zMCABeAFor
         rHyxj40/aiMZCBcQNZxVLaXqNqBVcMZe8t+IBhBQQi5k3Yho5C5NGW4CzyQq75DMMjHJ
         OFlhqPdXeM/VWsN+x9SAAm0a/KkACPXXTSBQqJSHTMkjCsJpI9XubV2FnMeT1KxyWWK0
         +zh0ejXAteWVyA5NsR17LKEg7rasUjIfJL7PSHU+3qBUMR+nnmuSgXFaWZ+DekTobsLi
         KoCw==
X-Gm-Message-State: AFuF++m81Q7ASGlCHUxnioonQr8mjV93k6P3uMmDFNNvClXbikDhkig9
	lWAcwj2nlF9Cf6YDXMbL80yObCiUQAbmEIQbNoch6pQ/A9GHxE25s2b4nExaY0Bl36/RlT0rdZl
	Q8Z9+Rw8IVY88UQebJnl6oHpzq8v3ygeLYx5dt++YTNXHxv1JLgf8XbkhEoizjYQp
X-Gm-Gg: AYBFou1xB0aqwx3rC/q/I2e76FkHTfjZvob2SZaUv9B40ebNjTmGz/MkJFHAjlN0hUo
	9hvTsA2D+cutotrHraYfxVHY76951e0QCEd6yZRTNc0hA0jyY6lwEzyoPv/IL/HRbHh/mI9/iSv
	mfHBB3T148rMahDZk5qVEfX1a4NCErvYQQpFcqp0C6/zRz+B7AOwx5Cb6OAKY6Iu6IPbq+hYnuS
	/DKbEGHCc2QTbUAuNeE8nicsnbR/GET755Dj7+7KTkxEkojJZSPtox+kqCSh4MsT4le6H7ieZXW
	b7l0i7kauV5tTVjfCIGbIlnm01/QXD5QYlDRR1+MFKcmkjUfAC5LnoB1/KUFx/bxG+QJA9s1NaU
	FQ89hCUq9Y4aMzYS9uI5+9Y8lYcrlxTG172NRcgqrjnC1us/lzvrQPf0=
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr2263717a91.15.1790350019304;
        Fri, 25 Sep 2026 08:26:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr2263703a91.15.1790350018748;
        Fri, 25 Sep 2026 08:26:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
References: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused
 ath12k_dp_rx_h_find_link_peer()
Message-Id: <179035001747.3875741.12204021916380057963.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 4GBQCd1S4XyDh12Qk7J_MRcBhnNKrfzw
X-Proofpoint-GUID: 4GBQCd1S4XyDh12Qk7J_MRcBhnNKrfzw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX2+yyx565YSJD
 57UWPzMdx4M/UxF4hr/V8I5ONbX7keEGc+GcwOo9rYMvDo6ksYRKRMbF01CWFwAq74LW4/Zkjv8
 jiaxrO+MOqbZCrqBBPHTxmi7PtDrTpE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX+JmkszUjg9mr
 gDxK2v6BKKG1LZWpbCQaLREpnhH+KwkZLsH9ZzqzN3eiT9vC0FV6mefsiD1NF/pj5MDZaj+eHkm
 +A5CZw/LZPF37jHYZPXXYhk0aFSyh2MFB3nDpI2PPmAWkHMdjJrpm7IUEEZEt4/ZNQ8nDElM9Si
 QeTyoISK17a10H3Xi/81NiACsPoIwySCy6NU39At8RMlxhZEbkEQqtiGHaL/PVXjz+z9scB98TV
 VC1wu594VhMJ90BIezt/toEMDi/mGpGokql3ZOJkves6mmcxYulNAgkmV+uOkkKeupJAAoTvjPH
 /LzDHk7PG4rwazdfjLs2xSYnOOQBqFwV3kYH5HnposKpcLf24EFM3HOTf8igYsW4Ve4ma7lHQCj
 IAhcemt3QcJ7g2EnfYWeZSQQYE/+i/Kcrwjpu+uPnjCjyfxHvY6dWUHcBeQTZo+4KviEHWiCgAb
 7X7D4PR9/huets/yDPw==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab692c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=luzD6lnB6LjBjRZFz1sA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_162707_457213_D525534B 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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


On Mon, 03 Aug 2026 09:05:32 +0800, Miaoqing Pan wrote:
> ath12k_dp_rx_h_find_link_peer() is no longer referenced anywhere,
> remove the unused helper and its declaration to avoid dead code.
> 
> Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove unused ath12k_dp_rx_h_find_link_peer()
      commit: e1ef274a49873a9545b51e36f1f1d25707372872

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


