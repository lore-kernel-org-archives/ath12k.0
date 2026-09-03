Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3001C61DD3
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=; b=zXe5989EmxYEU+YXrmF/Nxkvzp
	0pq19uM1oGPN4jdxq2EMwqSkV2DwpBC1KKvvNok1CzigeYkZsCWOreFGBFW+3Hq/A28Z8nxYJeBWs
	GcFNpxEVRMtQRwxW4HUrkbnc4N5F26sL23QK8ROOmc5UDzRNFq+fFDen1aIg2lCZTo6Q+X/aQyFWP
	HXirFs8trtw2uoykNanPJqb91As89VhTiubNb3x0N569Sl6m/v9/UQyJB1al573/EbNmwae9f1KW6
	4Cs+ugCpaqW/NagP0bw1UhJDdfD9TTQulSq9JrzK8V3jppA8ShKO/nBb5XgrFlPcMYTrhdPup80Iw
	+LvGRgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cht-00000000QGL-2772;
	Thu, 03 Sep 2026 19:02:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chr-00000000QFd-0DBk
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3AWl927810
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=; b=U+fKCQI5Xh6sbJFD
	gbSHXz77ap6DOuqUB+TaB0HOzyYAV7+yhQubQ9TYeA/0ZRBu2Si0btef3haw/8rg
	hcJ5rJ5GgCBPthIozH4o73NZ1I9DNKMoLjeDQNprilll8Qm3dNkKi2AS5DorK11n
	oxOtDSUHzRTig1RVJVlDun5iY+RRI7Yo/kLHEVYhORBuwHWZI9QrjPDDBOzDZZD9
	K7zW+rdesCxuwqdR9lKUvpZ3bMeKMwMUSxLtEpw5r3FnL4yFR7OI6VnpgpQAsOM2
	YA2js7ztzzsB2Ms/6feJQbM63S/R7Wa1NxkBDB5PorDsg9hCCtvSO+NcVbTzPV7q
	4iyBhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx2d11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so209232a91.1
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462157; x=1789066957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=;
        b=SFOWuRNJ0eSPT7bYdy0+lw/fG5azr62uhSa31ZxLnMgoUkm3QiC64RWuK7VK1SMw8S
         jtXYpaIxAN6Tm3AzO+vCSn0WQ6Bp9XPQYqQQfA6YRKjJn/AECAadmBb+uVNJ0bQjQnYr
         tAZMvO9Yoep4p5cSq31ZVF6G+2kPvG/s/uPoikfMJRb+GpLqMkg0OZos0bSwjQxpCzH1
         nuYlpkGrwqy1RXxnb0iHdKtWMoRdAxcSgYnZhg4A5uR7A1N3JDCNkoHisSlXMU25cq1U
         je3ZtTeZcBZ8dgqtpmhcB6cwYwrjUAFwpD4umVlZ/vxBgezcccjL7J86duxe5FhHhvLk
         FZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462157; x=1789066957;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=;
        b=a1Hzvr9Rzc3XXzYEm6NtSB8mUFfItVzqf3qSgSJZnb6vSS34rM/RnQcTVUZVlNtpFk
         cUz6PfKAYub2UaMxBSGAng37R7434v0O9TKG6tlsn4Y3UEF5x1J9AFrggm025kb4zFHo
         Frr8ffQqjs6gXNQX3vLy6f2Yc5MC6Rzj+2JRp7LIYDoJPj7ozBxOwPL8jsAZXtocJuM9
         ZhNJbPJG7YBPsQKkeQ10MJMXF7aTMZcO758of2/vtIf7uC/mQLtmXw/y1CVkhJ0+bKBC
         2iuFIeQX7F/PKoCZUFUXxSnQ4A+cq22GTEHZlyRqDH/wDFxiZeY1xh1fFSh5ETeW99/2
         fVtA==
X-Forwarded-Encrypted: i=1; AKwUvByxRUJPejOFkYSEl4XC1WH4YMmnOBoh6+8vPN+qEuSOiJ0mjePHHmUQ7va4h6lVeLulIsZARP0=@lists.infradead.org
X-Gm-Message-State: AFuF++nCjt+ppSYyxDfyEC2GlfWqOaRnsbUqSJY60LrPAY4OQPX/+NCg
	/6qZKslVE4+PP7AM7DeTV/M0yLIXDhRObNtMmWVplkFBNnWHh2zdRCmQn+ONFT43mZ2H0+gGJg5
	g9hV0dUQocprrCc8z9UIzwColZO/1/ejaaUfKsonCW8i2BJgsQJ25OgKe/kUaVrg4
X-Gm-Gg: AYBFou1xZ/vFft2YOE9uuksy2Y86jmnHd8tLISb6yJzhAIV8QlcDX5eDr63C406Tfeb
	PZ20FlOmtzFM8eGI5jawjs/aVC9OYMN23VhdVQNqYVby+IuxtdxZ372zFc1fuRsn7M9dWhEvISm
	yqB1Dj3UWR7TE9HOlUSRQaKxT5mDiqcZYZpHOsDQb8kes9yaq6G597RugeIuDvRWJ9NsoysxrHY
	vsCDLnefPEpOlg+SatyG4FEagjP3CpDyV9r3KRUuRvEhj9G3cqhkc1N9xCSlALIZZpzA0SZuQWA
	ilIUSmT44XlqN/vePakdMlp8N6eQztLbJxxlPzG9BwStZCmuR6b9Ej9PhUDnyrOU+nCN/dieyQY
	OiaUOto0XPD2oTPmaq84sLufi0+IrsV7bqnWImudzO5pkBTc7JpRNeDI=
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr658746a91.18.1788462156427;
        Thu, 03 Sep 2026 12:02:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr658662a91.18.1788462155797;
        Thu, 03 Sep 2026 12:02:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:35 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
References: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove skb->data check in
 ath12k_wmi_process_tpc_stats()
Message-Id: <178846215507.824911.1946775956361257237.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nTq8kLCyPlHNEEFTWjetyPN4JKY49rfc
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99c44d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tcO1i5LuZZfHbVICEYIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: nTq8kLCyPlHNEEFTWjetyPN4JKY49rfc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX1aHgq+TDOVDD
 6TW1AnPppeAt3mFkFvMS+c7YfLIOh4zAkQjxLrDbhm9orF7lpmVCN44fiNgXye3g5XaDH+y7aSk
 u5LpDbD2SJxEoQpCQHS86Yp2+K0O4VHY99fMnao1ef56yXIWieWxm6q5Pvs9/TGEB323AzXrzzc
 e233m4PkLwZbXXosjtgiSMyTEqaAfQKrVoeNwlajq2F46cRufQ2MhYJVHMc1L1ashs6iPjays1h
 lXyFUGcOlRMO/sja9J0aYIFU61YeZ3OfcCwI40J44bfPANK4r02pfIrmHXeRTsCQs3EDqpOyRpH
 KWbyjcUi5KdOvjcziNGbhCd0JzMLidJy5j9Pvans9+2VpoqcUXW1fLs00EMdO5HnH9UkQl0WVF6
 OFCdf9ROwH2NEKYjzoQAIO6AHfXmsJRNmvpoOVmHiFhjWToJoQw1cSK3vN7kF+H03/+P/kbdGsj
 q93drQaLjvQYgIjt6Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX/DML+8eIBuLn
 u4utXEz92vBCjM0bpd25dZ24NplKM+i+M7ZHM7NQ5ikAwCbiX2kcjD/BRdpyzMvyBWjDm+ouw7E
 hun4/nHmuw5hzeQTDEKLgtmUyBvHJks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120239_206087_69E41989 
X-CRM114-Status: UNSURE (   9.88  )
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


On Tue, 28 Jul 2026 18:15:24 -0700, Jeff Johnson wrote:
> Currently, ath12k_wmi_process_tpc_stats() has a !skb->data check.  This
> check is pointless since skb->data is accessed by ath12k_wmi_op_rx() in
> order to dispatch the message to this function, therefore it is always
> non-NULL.
> 
> Remove the pointless check and its associated warning message.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove skb->data check in ath12k_wmi_process_tpc_stats()
      commit: bd3e260f496adb0123076a237e5e72598dee0404

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


