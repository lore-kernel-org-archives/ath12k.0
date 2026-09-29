Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E956CA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL7pyPgCQt7X5fw95uOZQ6wlYPvKl6GZDpqy902WC8k=; b=LJJGKuyZ+cP4ejOmn2jbjBq/Rd
	36xk2ia9Wqc/ZNAGSBgDJxvy09NWdR0qF2pF1jdaJ8LwR+fPssJwKB9BRJtLlxwmPELqx2hHjBv24
	HzR3iSn5Yj2GF/r3ZAH9hIJ2Vpu2XiG5oZiEMoQXMiGwaHcz6NcFtfzwvoLuyoPj0XujtphiQb3+m
	JFlHxKjFo9ew1YAIyY5gQILpEypfXFyomfXIUbnbj5v4K6POTudqkHzQLg0DyzWNKksCObWM8GD/O
	9bFW83r3cCbtByQvVH7/fUmsK8qJeeqog/oOe8WBZzirGQOJzHBVoDSUuFJq8UaXbMmP/tdusGYF6
	M43g6/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbH4-000000048AD-3FGU;
	Tue, 29 Sep 2026 17:05:50 +0000
Received: from mail.holtmann.org ([81.169.141.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbH1-00000004899-3SaE;
	Tue, 29 Sep 2026 17:05:49 +0000
Received: from smtpclient.apple (p5b0a9ac0.dip0.t-ipconnect.de [91.10.154.192])
	by mail.holtmann.org (Postfix) with ESMTPSA id 0F38CFF100;
	Tue, 29 Sep 2026 19:05:42 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 19:05:31 +0200
Cc: manivannan.sadhasivam@oss.qualcomm.com,
 Manivannan Sadhasivam <mani@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org,
 ath12k@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_100548_035626_A40AB64F 
X-CRM114-Status: GOOD (  17.88  )
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

Hi Deepak,

>> Now that the QRTR driver allows using the unique node id for each =
device,
>> which is different from the node id received from the remote node, =
compute
>> a unique node id using a new API, qrtr_host_node_id().
>>=20
>> This API takes the 'index' parameter and adds it to =
QRTR_NODE_HOST_BASE,
>> whose value is outside of the node id range used by the remote nodes =
(0 to
>> 0xffff).
>>=20
>> Finally, call the new API from MHI endpoint driver by passing the MHI
>> controller index as the parameter. The MHI controller index is unique =
for
>> each controller, thereby for each MHI endpoint device.
>>=20
>> Signed-off-by: Manivannan Sadhasivam =
<manivannan.sadhasivam@oss.qualcomm.com>
>> ---
>>  MAINTAINERS        |  1 +
>>  include/net/qrtr.h | 21 +++++++++++++++++++++
>>  net/qrtr/mhi.c     |  4 +++-
>>  3 files changed, 25 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index df8ab9b82402..9c8bb086be28 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
>>  M: Manivannan Sadhasivam <mani@kernel.org>
>>  L: linux-arm-msm@vger.kernel.org
>>  S: Maintained
>> +F: include/net/qrtr.h
>>  F: include/trace/events/qrtr.h
>>  F: include/uapi/linux/qrtr.h
>>  F: net/qrtr/
>> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
>> new file mode 100644
>> index 000000000000..745d51b4a6ba
>> --- /dev/null
>> +++ b/include/net/qrtr.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _NET_QRTR_H
>> +#define _NET_QRTR_H
>> +
>> +#include <linux/types.h>
>> +
>> +/* The offset is chosen carefully to not collide with the node ids =
allocated by
>> + * the remote nodes. All the remote nodes use node ids in range 0 to =
0xffff.
>> + */
>> +#define QRTR_NODE_HOST_BASE 0x10000u
>=20
> Can it be exposed with include/uapi/linux/qrtr.h also. There are user =
space clients like modem manager
> which need to calculate modified node id to distinguish same service =
from multi modem over mhi.
> This is same as wlan use case.

did anybody actually looked at the proposal that Denis and I came up =
with. It was exactly addressing this properly.

It seems you guys came up with some hot fix and want to run with it. =
After month and month of silence and not bothering to review the =
proposal, you are trying to push your thing?

If you don=E2=80=99t support userspace, your proposal is broken. Plain =
and simple.

Regards

Marcel


